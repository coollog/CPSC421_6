(* env.sml *)
(* Christopher Chute *)
(* April 3, 2017 *)
(* CPSC 421 - Zhong Shao *)

signature ENV =
sig
  type access
  type level
  type label
  type ty

  datatype enventry 
    = VARentry of {access: access, ty: ty, isMutable: bool}
    | FUNentry of {level: level, label: label, formals: ty list, result: ty}

  type tenv = ty Symbol.table
  type env = enventry Symbol.table

  val base_tenv : tenv
  val base_env : env
end

functor EnvGen(Translate: TRANSLATE): ENV = 
struct

  structure S = Symbol
  structure T = Types
  structure Tr = Translate

  type access = Tr.access
  type level = Tr.level
  type label = Temp.label
  type ty = T.ty

  datatype enventry 
    = VARentry of {access: access, ty: ty, isMutable: bool}
    | FUNentry of {level: level, label: label, formals: ty list, result: ty}

  type tenv = ty S.table

  type env = enventry S.table

  (* Primitive Types: Base types environment consists of INT and STRING *)
  val base_tenv: tenv = let val t = S.enter(S.empty, S.symbol("int"), T.INT)
                        in S.enter(t, S.symbol("string"), T.STRING) end;

  (**
   * Primitive Library Functions (Appendix A.4 in Appel)
   * ---------------------------
   * function chr(i: int) : string
   * function concat (s1: string, s2: string) : string
   * function exit(i: int)
   * function flush()
   * function getchar() : string
   * function not(i: int) : int
   * function ord(s: string) : int
   * function print(s: string)
   * function size(s: string) : int
   * function substring(s: string, first: int, n: int) : string
   *)
  val base_env =
    let 
      (* Construct a function entry with the given name, formals, and result. *)
      fun funentry(name, fs, r) =
        FUNentry({
          level=Tr.outermost,
          label=Temp.namedlabel(name),
          formals=fs,
          result=r
        })
      val e = S.enter(S.empty, S.symbol "chr", funentry("chr", T.INT :: nil, T.STRING))
      val concatFmls = T.STRING :: (T.STRING :: nil)
      val e = S.enter(e, S.symbol "concat", funentry("concat", concatFmls, T.STRING))
      val e = S.enter(e, S.symbol "exit", funentry("exit", T.INT :: nil, T.UNIT))
      val e = S.enter(e, S.symbol "flush", funentry("flush", nil, T.UNIT))
      val e = S.enter(e, S.symbol "getchar", funentry("getchar", nil, T.STRING))
      val e = S.enter(e, S.symbol "not", funentry("not", T.INT :: nil, T.INT))
      val e = S.enter(e, S.symbol "ord", funentry("ord", T.STRING :: nil, T.INT))
      val e = S.enter(e, S.symbol "print", funentry("print", T.STRING :: nil, T.UNIT))
      val e = S.enter(e, S.symbol "size", funentry("size", T.STRING :: nil, T.INT))
      val substringFmls = (T.STRING :: (T.INT :: (T.INT :: nil)))
      val e = S.enter(e, S.symbol "substring", funentry("substring", substringFmls, T.STRING))
    in
      e
    end;
end  (* structure Env *)
  
