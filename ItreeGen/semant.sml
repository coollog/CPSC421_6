(* semant.sml *)
(* Christopher Chute *)
(* April 2, 2017 *)
(* CPSC 421 - Zhong Shao *)

signature SEMANT =
sig
  type ir_code
  val transprog: Absyn.exp -> Frame.frag list
end

functor SemantGen (Register: REGISTER_STD): SEMANT =
struct

  structure A = Absyn
  structure F = Format
  structure S = Symbol
  structure T = Types
  structure Tr = TranslateGen(Register)
  structure E = EnvGen(Tr)

  val error = ErrorMsg.error
  val impossible = ErrorMsg.impossible
  type ir_code = Tr.gexp
  type expty = {exp: ir_code, ty: T.ty}

  (* Global stack for checking whether we're inside a 'for' or 'while' loop *)
  val loopDepths = ref [0]

  (* Utility Functions ********************************************************)

  (* Keep track of loop depth *)
  fun changeLoopDepth(delta: int) =
    let
      val currentDepth = hd (!loopDepths)
    in
      loopDepths := ((currentDepth + delta)::(tl (!loopDepths)))
    end

  (* check<TYPE>: (expty, int) -> unit *)
  (* Check that an expression is of type TYPE, otherwise print error *)
  fun checkInt(exp: expty, pos) =
    case (#ty exp) of T.INT => ()
                 | _        => error pos "expected integer";
  fun checkStr(exp: expty, pos) =
    case (#ty exp) of T.STRING => ()
                 | _           => error pos "expected string";
  fun checkRec(exp: expty, pos) =
    case (#ty exp) of T.RECORD(_, _) => ()
                 | _                 => error pos "expected record";
  fun checkArr(exp: expty, pos) =
    case (#ty exp) of T.ARRAY(_, _) => ()
                 | _                => error pos "expected array";
  fun checkUnit(exp: expty, pos) =
    case (#ty exp) of T.UNIT => ()
                 | _         => error pos "expected unit";

  (* actualType: look "through" all NAME types until finding actual type *)
  fun actualType(T.NAME (_, optTy)) = 
    (case (!optTy) of SOME (ty) => actualType(ty)
                    | NONE      => (impossible "actualType called on unbound type";
                                    T.UNIT))
    | actualType(ty) = ty;

  (* areSameType: Check whether two expressions have same type. *)
  fun areSameType(ty: T.ty, ty': T.ty): bool =
    let
      val t  = actualType(ty)
      val t' = actualType(ty')
    in
    (case t
      of T.NIL =>
        (case t' of T.RECORD(_, _) => true
                  | _ => false)
       | T.INT =>
        (case t' of T.INT => true
                  | _ => false)
       | T.STRING =>
        (case t' of T.STRING => true
                  | _ => false)
       | T.UNIT =>
        (case t' of T.UNIT => true
                  | _ => false)
       | T.RECORD(_, u) =>
        (case t' of T.RECORD(_, u') => (u=u') (* Unique ID must match *)
                  | T.NIL => true             (* All records come with NIL *)
                  | _ => false)
       | T.ARRAY(_, u) =>
        (case t' of T.ARRAY(_, u') => (u=u')
                  | _ => false)
       | _ => false)
  end

  (* lookupResultTy: look up the result type for a function declaration *)
  fun lookupResultTy(result: (S.symbol * int) option, tenv: T.ty S.table) = 
    (case result of NONE => T.UNIT (* Procedure *)
                  | SOME (tySymbol, pos) => 
                    (case S.look (tenv, tySymbol)
                      of NONE      =>
                        (error pos ("return type '" ^ (S.name tySymbol) ^ "' undefined");
                         T.UNIT)
                       | SOME (ty) => ty));

  (* fieldType: look up the type of a record field *)
  fun fieldType(id: S.symbol, ((s, t) :: fs): (S.symbol * T.ty) list, pos) =
      if s = id then actualType(t) else fieldType(id, fs, pos)
    | fieldType(id, nil, pos) = (error pos ("invalid field '" ^ (S.name id) ^ "'"); T.UNIT);

  (* Translating Type Expressions *********************************************)

  (* transty : (E.tenv * A.ty) -> (T.ty * A.pos) *)
  (* Translate an Absyn.ty to a Types.ty *)
  fun transty (tenv, A.ArrayTy(id, pos)) =
      (case S.look(tenv, id)
        of NONE => (error pos ("type '" ^ (S.name id) ^ "' undefined");
                    (T.ARRAY(T.INT, ref ()), pos))
         | SOME(ty) => (T.ARRAY(ty, ref ()), pos))
    | transty (tenv, A.RecordTy(fields)) = 
      let
        (* Get position of leftmost field *)
        val pos = if fields = nil then 0 else (#pos (hd fields))
        (* Make a function for translating a absyn field to a T.RECORD field *)
        fun transField({name: S.symbol, typ: S.symbol, pos}): (S.symbol * T.ty) = 
          (case S.look(tenv, typ)
            of NONE => (error pos ("type '" ^ (S.name typ) ^ "' not defined");
                        (name, T.INT))
             | SOME(ty) => (name, ty))
        (* Translate the fields *)
        val translatedFields = List.map transField fields
      in
        (* Construct a T.RECORD with the translated fields and a unique ID *)
        (T.RECORD(translatedFields, ref ()), pos)
      end
    | transty (tenv, A.NameTy(id, pos)) =
      (case S.look(tenv, id)
        of NONE => (error pos ("type '" ^ (S.name id) ^ "' not defined"); (T.INT, pos))
         | SOME(ty) => (ty, pos)); (* Note: Might be a T.NAME *)

  (* Translating Expressions **************************************************)

  (**
   * transexp : (E.env * E.tenv, Tr.level) -> (A.exp -> {exp : ir_code, ty : T.ty})
   * Translate an expression into its intermediate representation and its type.
   * The ir_code is used in later stages (i.e., CodeGen and RegAlloc), while the type
   * information is used for type-checking within this module. The `breakLabel` formal
   * parameter is used to keep track of the immediately enclosing loop, so that we can
   * exit that loop with a break statement and jump to the proper location.
   *)
  fun transexp (env: E.env, tenv: E.tenv, level: Tr.level, breakLabel: Temp.label) expr =
    let
      fun g (A.VarExp var) = h(var)
        | g (A.NilExp) = {exp = Tr.transNil(), ty = T.NIL}
        | g (A.IntExp i) = {exp = Tr.transInt(i), ty = T.INT}
        | g (A.StringExp s) = {exp = Tr.transStr(#1 s), ty = T.STRING}
        | g (A.AppExp {func, args, pos}) =
          let
            (* Check the actual parameters against the formal parameters *)
            fun checkParams (actuals, formals, i: int) = 
              (* Check to make sure same number of parameters *)
              if actuals = nil andalso formals = nil then ()
              else if actuals = nil andalso formals <> nil
                then error pos "not enough arguments specified"
              else if actuals <> nil andalso formals = nil
                then error pos "too many arguments specified"
              else (* at least one field in actuals and formals *)
                let
                  val {ty=tyAp, ...} = g (hd actuals)
                  val tyFp = (hd formals)
                in
                  (if areSameType(tyAp, tyFp) then ()
                   else error pos ("type mismatch for parameter " ^ (Int.toString i)
                                   ^ " of function '" ^ (S.name func) ^ "'");
                  checkParams (tl actuals, tl formals, i+1))
                end
            (* Process the arguments to be passed to the function *)
            val params = (List.map #exp (List.map g args))
          in
            (case S.look (env, func)
              of SOME (E.FUNentry {formals, label, level=funLevel, result}) => 
                  (checkParams (args, formals, 1);
                  {
                    exp = Tr.transFunCall(label, params, funLevel, level),
                    ty = actualType(result)
                  })
               | _ => (error pos ("undefined function '" ^ (S.name func) ^ "'");
                      {exp = Tr.transError(), ty = T.UNIT}))
          end
        | g (A.OpExp {left, oper, right, pos}) =
          let
            (* Recursively analyze the left and right expressions *)
            val {exp = expLeft, ty = tyLeft} = g(left)
            val {exp = expRight, ty = tyRight} = g(right)
            fun opToStr(oper) =
              (case oper
                of A.EqOp => "'='"
                 | A.NeqOp => "'<>'"
                 | A.LtOp => "'<'"
                 | A.LeOp => "'<='"
                 | A.GtOp => "'>'"
                 | A.GeOp => "'>='"
                 | A.PlusOp => "'+'"
                 | A.MinusOp => "'-'"
                 | A.DivideOp => "'/'"
                 | A.TimesOp => "'*'")
          in
            if (oper = A.EqOp orelse oper = A.NeqOp) then 
              (* Equality check: Valid for ints, strings, records, arrays *)
              (case (tyLeft)
                of T.UNIT =>
                    ((error pos "operand type 'UNIT' does not allow equality test");
                    {exp = Tr.transError(), ty = T.INT})
                 | T.NAME(_, _) =>
                    ((error pos "operand type 'NAME' does not allow equality test");
                    {exp = Tr.transError(), ty = T.INT})
                 | T.STRING => 
                    (if areSameType(tyLeft, tyRight)
                    then {exp = Tr.transStrcmp(expLeft, oper, expRight), ty = T.INT}
                    else ((error pos ("expected string in equality comparison "^opToStr(oper));
                          {exp = Tr.transError(), ty = T.INT})))
                 | _ =>
                    (if areSameType(tyLeft, tyRight)
                    then {exp = Tr.transBinop(expLeft, oper, expRight), ty = T.INT}
                    else ((error pos ("type mismatch in equality comparison "^opToStr(oper)));
                          {exp = Tr.transError(), ty = T.INT})))
            else if (oper = A.LtOp orelse oper = A.LeOp orelse
                     oper = A.GtOp orelse oper = A.GeOp) then
              (* Comparison: Valid for ints, strings *)
              (case (tyLeft)
                of T.STRING =>
                    (if areSameType(tyLeft, tyRight)
                    then {exp = Tr.transStrcmp(expLeft, oper, expRight), ty = T.INT}
                    else ((error pos ("expected string in binary comparison "^opToStr(oper));
                          {exp = Tr.transError(), ty = T.INT})))
                 | T.INT => 
                    (if areSameType(tyLeft, tyRight)
                    then {exp = Tr.transBinop(expLeft, oper, expRight), ty = T.INT}
                    else ((error pos ("expected integer in binary comparison "^opToStr(oper)));
                          {exp = Tr.transError(), ty = T.INT}))
                 | _ => (error pos ("illegal type for order comparison " ^ opToStr(oper));
                         {exp = Tr.transError(), ty=T.INT}))
            else (* oper = A.PlusOp, A.MinusOp, A.TimesOp, or A.DivideOp *)
              (* Arithmetic: Valid for ints only *)
              (case (tyLeft)
                 of T.INT => 
                    (if areSameType(tyLeft, tyRight)
                    then {exp = Tr.transBinop(expLeft, oper, expRight), ty = T.INT}
                    else ((error pos ("expected integer in arithmetic expression " ^ opToStr(oper)));
                          {exp = Tr.transError(), ty = T.INT}))
                 | _ => (error pos ("illegal type for order comparison " ^ opToStr(oper));
                         {exp = Tr.transError(), ty = T.INT}))
          end
        | g (A.RecordExp {typ, fields=afs, pos}) =
          let
            type afList = (S.symbol * A.exp * int) list
            type tfList = (S.symbol * T.ty) list
            fun checkFields(afields: afList, tfields: tfList) =
              (* Check to make sure same number of fields *)
              if afields = nil andalso tfields = nil then ()
              else if afields = nil andalso tfields <> nil
                then error pos "not enough fields specified"
              else if afields <> nil andalso tfields = nil
                then error pos "too many fields specified"
              else (* at least one field in afields and tfields *)
                let
                  (* extract head of both lists *)
                  val af = hd afields
                  val tf = hd tfields
                  val {ty=aty, ...} = g (#2 af) (* evaluate exp to get type *)
                  val tty = (#2 tf)             (* extract expected type *)
                in
                  (* make sure field name matches expected -- must be in order *)
                  (if (#1 af) <> (#1 tf)
                    then error (#3 af) ("expected binding for field '" ^ (S.name (#1 tf))
                                        ^ "', found binding for '" ^ (S.name (#1 af)) ^ "'")
                  else if areSameType(aty, tty) = false
                    then error pos ("invalid type for field '" ^ (S.name (#1 af)) ^ "'")
                  else ());
                  checkFields(tl afields, tl tfields)
                end
            (* Translate the field expressions into gexps for transRecordInit *)
            val fieldExps = (List.map #exp (List.map g (List.map #2 afs)))
          in
            (case S.look (tenv, typ)
              of SOME(ty) => 
                (case actualType(ty)
                  of T.RECORD(tfs, unique) =>
                      (checkFields (afs, tfs);
                      {
                        exp = Tr.transRecordInit(fieldExps),
                        ty = T.RECORD(tfs, unique)
                      })
                   | _ => (error pos ("type '" ^ (S.name typ) ^ "' not a valid record type");
                          {exp=Tr.transError(), ty=T.RECORD(nil, ref ())}))
               | NONE => (error pos ("undefined type '" ^ (S.name typ) ^ "'");
                          {exp=Tr.transError(), ty=T.RECORD(nil, ref ())}))
          end
        | g (A.SeqExp (exps)) = 
            let
              (* Type-check all expressions in the sequence *)
              val expTys = (List.map g (List.map #1 exps))
              (* The type of the last expression is the type of the sequence *)
              val tyLast = (if (List.length(expTys) = 0) then T.UNIT
                            else (#ty (List.last expTys)));
            in
              {
                exp = Tr.transSeq(List.map #exp expTys),
                ty = tyLast
              }
            end
        | g (A.AssignExp {var, exp, pos}) =
            ((case var (* Check whether var is a loop counter *)
                of A.SimpleVar(id, _) =>
                    (case S.look(env, id)
                      of SOME(E.VARentry {isMutable, ...}) =>
                        if isMutable then ()
                        else error pos ("cannot assign to loop counter '"^(S.name id)^"'")
                       | _ => ())
                 | _ => ());
            (let
              val {exp = expLHS, ty = tyLHS} = h(var)
              val {exp = expRHS, ty = tyRHS} = g(exp)
            in
              if (areSameType(tyLHS, tyRHS))
              then {exp = Tr.transAssign(expLHS, expRHS), ty = T.UNIT}
              else ((error pos "type mismatch in assignment");
                    {exp = Tr.transError(), ty = T.UNIT})
            end))
        | g (A.IfExp {test, then', else' as NONE, pos}) =
            let
              val {exp = expTest, ty = tyTest} = g(test)
              val {exp = expThen, ty = tyThen} = g(then')
            in
              (if (tyTest = T.INT) then ()
              else (error pos "predicate for conditional must be of type 'int'");
              checkUnit({exp = expThen, ty = tyThen}, pos);
              {exp = Tr.transCond(expTest, expThen), ty = T.UNIT})
            end
        | g (A.IfExp {test, then', else' as SOME(else''), pos}) =
            let
              val {exp = expTest, ty = tyTest} = g(test)
              val {exp = expThen, ty = tyThen} = g(then')
              val {exp = expElse, ty = tyElse} = g(else'')
            in
              (if (tyTest = T.INT) then ()
              else (error pos "predicate for conditional must be of type 'int'");
              if (areSameType(tyThen, tyElse))
              then {exp = Tr.transCondElse(expTest, expThen, expElse), ty = tyThen}
              else ((error pos "incompatible types in 'then' and 'else' blocks");
                   {exp = Tr.transError(), ty = T.UNIT}))
            end
        | g (A.WhileExp {test, body, pos}) =
            let
              val gTest = g(test)
              val endOfLoopLabel = Temp.newlabel()
            in
              (changeLoopDepth(1);
              checkInt(gTest, pos);
              (let
                (* Translate the body using the new end-of-loop label *)
                val gBody = transexp(env, tenv, level, endOfLoopLabel) body
              in
                checkUnit(gBody, pos);
                changeLoopDepth(~1);
                {
                  exp = Tr.transWhile(#exp gTest, #exp gBody, endOfLoopLabel),
                  ty = T.UNIT
                 }
              end))
            end
        | g (A.ForExp {var, lo, hi, body, pos}) =
            let
              (* Extract the iterator symbol and var entry *)
              val iterVarSymbol = (#name var)
              (* Allocate space for the counter as a local variable *)
              val (counterLevel, counterOffset) = Tr.allocInFrame(level)
              (* Enter the counter as a (immutable) local variable *)
              val iterVarEntry = E.VARentry({
                access = (counterLevel, counterOffset),
                ty = T.INT,
                isMutable = false
              })
              (* Create a new label for the end of the 'for' loop *)
              val endOfLoopLabel = Temp.newlabel()
              (* Add the iterator to the var env for translating the body *)
              val env' = S.enter(env, iterVarSymbol, iterVarEntry)
              (* Process the low and high expressions *)
              val gLow = g(lo)
              val gHigh = g(hi)
            in
              (changeLoopDepth(1);
               checkInt(gLow, pos);
               checkInt(gHigh, pos);
               let
                (* Translate the body in an environment with this loop's break label *)
                 val translatedBody = transexp(env', tenv, level, endOfLoopLabel) body
               in
                 (checkUnit(translatedBody, pos);
                 changeLoopDepth(~1);
                 {
                  exp = Tr.transFor(
                    counterOffset,
                    #exp(gLow),
                    #exp(gHigh),
                    #exp(translatedBody),
                    endOfLoopLabel),
                  ty = T.UNIT
                 })
               end)
            end
        | g (A.BreakExp pos) =
          (* Use the break label passed in transexp to break to the proper location *)
          if (hd(!loopDepths) > 0) then ({exp = Tr.transBreak(breakLabel), ty = T.UNIT})
          (* A break that is not within a while or for is illegal *)
          else ((error pos "'break' must be contained in a 'while' or 'for' loop");
                {exp = Tr.transError(), ty = T.UNIT})
        | g (A.LetExp {decs, body, pos}) = 
            let
              (* Get list of translated binding expressions *)
              val (env', tenv', bindings) = transdecs (env, tenv, decs, level, breakLabel)
              val {exp, ty} = transexp (env', tenv', level, breakLabel) body
            in
              (* Get a sequence that performs the variable bindings, then the body *)
              {exp = Tr.transSeq(bindings @ [exp]), ty = ty}
            end
        | g (A.ArrayExp {typ, size, init, pos}) =
        let
          val {exp = expInit, ty = tyInit} = g(init)
          val {exp = expSize, ty = tySize} = g(size)
        in
          (* Make sure the type is a declared array type, and initializer type matches *)
          (case S.look(tenv, typ)
            of SOME(ty) => 
              (case actualType(ty) 
                of T.ARRAY(t, u) => 
                    if areSameType(t, tyInit)
                    then {exp = Tr.transArrayInit(expSize, expInit), ty = T.ARRAY(t, u)}
                    else ((error pos "incompatible type for array initializer");
                          {exp = Tr.transError(), ty = T.INT})
                 | _ => (error pos ("type '" ^ (S.name typ) ^ "' not a valid array type");
                         {exp = Tr.transError(), ty = T.INT}))
             | NONE => (error pos ("undefined type '" ^ (S.name typ) ^ "'");
                        {exp = Tr.transError(), ty = T.INT}))
        end
        (* function dealing with "var", may be mutually recursive with g *)
        and h (A.SimpleVar (id, pos)) =
              (case S.look(env, id)
                of SOME(E.VARentry({access, ty, ...})) => 
                    {exp = Tr.transSimpleVar(access, level), ty = actualType(ty)}
                 | SOME(E.FUNentry(_)) =>
                    (error pos "expected variable, found function";
                     {exp = Tr.transError(), ty=T.UNIT})
                 | _ => (error pos ("undefined variable '" ^ (S.name id) ^ "'");
                         {exp = Tr.transError(), ty=T.INT}))
          | h (A.FieldVar(v, id, pos)) =
            let
              val {exp = expRecord, ty = tyRecord} = h(v)
              fun fieldIndex(id, (f::fs): (S.symbol * T.ty) list, acc, pos) =
                  if (id = (#1 f)) then acc else fieldIndex(id, fs, pos, acc+1)
                | fieldIndex(id, nil, acc, pos) =
                  ((error pos "invalid field access"); 0)
            in
              (case (tyRecord)
                of (T.RECORD(fs, _)) =>
                      {
                        exp = Tr.transRecordAccess(expRecord, fieldIndex(id, fs, pos, 0)),
                        ty = fieldType(id, fs, pos)
                      }
                 | _ => (error pos "invalid field access"; {exp=Tr.transError(), ty=T.INT}))
            end
          | h (A.SubscriptVar(v, subExp, pos)) =
              let
                val {exp = expArray, ty = tyArray} = h(v)
                val exptySub = g(subExp)
              in
                (checkInt(exptySub, pos);
                 (case (tyArray)
                  of T.ARRAY(tyElts, _) => 
                      {
                        exp = Tr.transArrayAccess(expArray, #exp(exptySub)),
                        ty = actualType(tyElts)
                      }
                  | _ => (error pos "invalid subscript access";
                          {exp = Tr.transError(), ty=T.INT})))
              end
     in g(expr)
    end

  (* Translating Declarations **************************************************)

  (**
   * transdec: (E.env * E.tenv * A.dec * Tr.level) -> (E.env * E.tenv * Tr.gexp list)
   * Returns augmented environment, type environment, and the binding that was added.
   * In the case of FunDec and TyDec, we require a list of gexp's for constructing
   * mutually recursive sets of bindings.
  *)
  and transdec (env, tenv, A.VarDec({var, typ, init, pos}), level, breakLabel) =
        let
          (* Get the type of the initialization expression *)
          val {ty = tyInit, exp = expInit} = transexp (env, tenv, level, breakLabel) init
          (* Get the actual variable type *)
          val tyActual = 
            (case typ 
              of SOME(symTy, _) => 
                (case S.look(tenv, symTy)
                  of SOME(ty) =>
                    let
                      val tyDecl = actualType(ty)
                    in
                      (if areSameType(tyDecl, tyInit) then ()
                      else error pos "incompatible type in declaration";
                      tyDecl)
                    end
                   | NONE => (error pos ("type '" ^ (S.name symTy) ^ "' undefined");
                              T.INT))
               | NONE =>
                (case tyInit
                  of T.NIL => 
                    (error pos ("must specify record type for 'nil'");
                     T.NIL)
                   | _ => tyInit)) (* No explicit type => Inherit init's type *)
            (**
             * Construct this variable's access information. When this variable
             * is used in an expression, Semant will pass this info to Translate
             * to generate the machine code to access this variable.
             *)
            val access = Tr.allocInFrame(level) (* TODO: Is all allocInRegister for RegAlloc? *)
            val varEntry = E.VARentry({
              access = access,
              ty = tyActual,
              isMutable = true
            })
        in
          (
            S.enter(env, (#name var), varEntry),
            tenv,
            SOME(Tr.transVarDec(expInit, access))
          )
        end
    | transdec (env, tenv, A.FunctionDec (fundecs), level, breakLabel) =
        let
          type vardec = {name: S.symbol, escape: bool ref}
          fun lookupParamTy ({var: vardec, typ: S.symbol, pos}) =
            (case (S.look (tenv, typ))
              of SOME ty => {name = (#name var), ty = ty}
               | NONE    => (error pos ("invalid type for parameter " ^ S.name (#name var));
                             {name=(#name var), ty=T.INT}))
          (* processHeader: process a function declaration, add resulting binding to env *)
          fun processHeader({name, params, result, body, pos}: A.fundec,
                            (env, tenv, names): (E.env * E.tenv * S.symbol list)) =
            let
              (* Scan the names list for duplicates *)
              fun checkDup(key: S.symbol, (nm::nms): S.symbol list) =
                  if key=nm then error pos ("duplicate function declaration for '" ^ (S.name key) ^ "'")
                  else checkDup(key, nms)
                | checkDup(key, nil) = ()
              (* Look up the type of each parameter *)
              val formals = List.map #ty (List.map lookupParamTy params)
              (* Lookup expected return type *)
              val tyExpected = lookupResultTy(result, tenv)
              (* Construct a level for this function, which will be passed to *)
              (* the Translate module on each invocation of this function *)
              val newLevel = Tr.newLevel({
                parent = level,
                formals = formals
              })
              (* Construct a new function entry with these formal parameters *)
              val funEntry = E.FUNentry({
                level = newLevel,
                label = Temp.newlabel(),
                formals = formals,
                result = tyExpected
              })
            in
              (* Return the environment augmented with header *)
              (checkDup(name, names);
              (S.enter (env, name, funEntry), tenv, (name::names)))
            end
          (* processBody: process a function body, assuming all headers in env *)
          fun processBody({name, body, pos, params, ...}: A.fundec,
                          (env, tenv): (E.env * E.tenv)) =
            (loopDepths := (0::(!loopDepths)); (* Add new loop depth to stack *)
            let
              val {result=tyExpected, formals, level=funLevel, label=funName} = 
                (case S.look(env, name)
                  of SOME(E.FUNentry(header)) => header
                   | _ => (impossible "function header not found"; 
                           {result=T.UNIT, formals=nil, level=Tr.outermost, label=Temp.newlabel()}))
              (* Add a parameter to the local environment. This function is left-folded over the params. *)
              fun enterParam((param, ty): (A.formals * T.ty), (env, funLevel, paramNumber): (E.env * Tr.level * int)) =
                (S.enter(env,
                        #name (#var param),
                        E.VARentry({
                          access = Tr.getAccessForParam(funLevel, paramNumber),
                          ty = ty,
                          isMutable = true (* Formal parameters are mutable *)
                        })),
                funLevel,        (* Continue adding parameters to this function's level *)
                paramNumber + 1) (* Increment the param number as we fold across the list *)
              val env' = #1 (List.foldl enterParam (env, funLevel, 1) (ListPair.zip(params, formals)))
              val {ty=tyReturned, exp=expBody} = transexp (env', tenv, funLevel, breakLabel) body
            in
              (if areSameType(tyReturned, tyExpected) then ()
               else error pos ("incompatible return type for function '" ^ (S.name name) ^ "'");
               loopDepths := (tl (!loopDepths)); (* Pop loop depth off stack *)
               Tr.addFunDec(funName, funLevel, expBody); (* Add the function fragment *)
               (env, tenv))
            end)
          (* Stage 1: Process all headers, remember the resulting environments *)
          val (env', tenv', _) = List.foldl processHeader (env, tenv, nil) fundecs
          (* Stage 2: Process all bodies, no need for the resulting environments *)
          val _ = List.foldl processBody (env', tenv') fundecs
        in
          (env', tenv', NONE) (* We produce fragments rather than returning a gexp *)
        end
    | transdec (env, tenv, A.TypeDec (tydecs), level, breakLabel) =
        let
          (* processHeader: process a type declaration header, add header to env *)
          fun processHeader({name, ty, pos},
                            (env, tenv, names): (E.env * E.tenv * S.symbol list)) =
              let
                (* checkDup: scan the names list for duplicates *)
                fun checkDup(key: S.symbol, (nm::nms): S.symbol list) =
                    if key=nm then error pos ("duplicate type declaration for '" ^ (S.name key) ^ "'")
                    else checkDup(key, nms)
                  | checkDup(key, nil) = ()
              in
                (checkDup(name, names);
                 (env, S.enter(tenv, name, T.NAME(name, ref NONE)), (name::names)))
              end
          (* processBody: process a type dec body, assuming all headers in env *)
          fun processBody({name, ty, pos}, (env, tenv): (E.env * E.tenv)) =
              let
                fun containsCycle(origType: T.ty, rhs: T.ty): bool =
                  (case rhs
                    of T.NAME(rhsName, rhsRef) =>
                      (case (!rhsRef)
                        of SOME(rhs') =>
                          if rhs'=origType
                          then (error pos ("cycle detected in type '"^(S.name name)^"'");
                                true)
                          else containsCycle(origType, rhs')
                         | _ => false)
                     | _ => false)
                (* Look up the header created by processHeader *)
                val (tyHeader, tyHeaderRef) =
                  (case S.look(tenv, name)
                    of SOME(typ as T.NAME(_, typRef)) => (typ, typRef)
                     | _ => impossible "undefined reference in type declarations")
                (* Translate the RHS ty using transty *)
                val tyActual = (#1 (transty(tenv, ty)))
              in
                (* Assign actual type to the header reference *)
                (if containsCycle(tyHeader, tyActual)
                 then tyHeaderRef := SOME(T.INT)
                 else tyHeaderRef := SOME(tyActual);

                (env, tenv)) (* No fragments or gexp's are needed for type declarations *)
              end
          (* Stage 1: Process headers *)
          val (env', tenv', _) = List.foldl processHeader (env, tenv, nil) tydecs
          (* Stage 2: Process bodies *)
          val _ = List.foldl processBody (env', tenv') tydecs
        in (env', tenv', NONE) end

  (**
   * transdecs : (E.env * E.tenv * A.dec list * Tr.level) -> (E.env * E.tenv)
   * Returns an augmented value env and an augmented type env that are used
   * in processing the body of the associated let expression.
   * Also returns an `exp list` of assignment expressions to initialize
   * the variables that are bound by the let expression.
   *)
  and transdecs (env, tenv, nil, level, breakLabel) = (env, tenv, nil)
    | transdecs (env, tenv, dec::decs, level, breakLabel): (E.env * E.tenv * Tr.gexp list) =
        let
          val (env', tenv', binding) = transdec (env, tenv, dec, level, breakLabel)
          val (env'', tenv'', bindings) = transdecs (env', tenv', decs, level, breakLabel)
        in 
          (case (binding)
            of SOME(b) => (env'', tenv'', b::bindings)
             | NONE => (env'', tenv'', bindings))
        end;

  (**
   * transprog : A.exp -> F.frag list
   * Translate a Tiger program into an intermediate representation code
   * tree encapsulated in a list of fragments.
   *)
  fun transprog(prog) =
    let
      (* Construct the tigermain level, inside outermost with no formals *)
      val tigermainLevel = Tr.newLevel({parent = Tr.outermost, formals = []})
      (* Type-check the program and get the translated body for tigermain *)
      val {exp = tigermainBody, ...} = (transexp (E.base_env, E.base_tenv, Tr.outermost, Temp.newlabel()) prog)
    in
      (Tr.addMainFunDec(tigermainBody, tigermainLevel);
      Tr.getResult())
    end;

end  (* structure Semant *)
