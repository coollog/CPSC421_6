(*
 * Assignment 6
 * CS 521 Spring 2017
 * Wolf Honore
 *)

signature ENV =
sig
  type access
  type level
  type label
  type ty

  datatype rw
    = RW
    | RO

  datatype enventry
    = VARentry of {access : access, ty : ty, rw : rw}
    | FUNentry of {level : level, label : label, formals : ty list, result : ty}

  type tenv = ty Symbol.table
  type env = enventry Symbol.table

  val base_tenv : tenv
  val base_env : env
end

functor EnvGen (Translate : TRANSLATE) : ENV =
struct
  structure S = Symbol
  structure Ty = Types
  structure Tr = Translate
  structure T = Temp

  type access = Tr.access
  type level = Tr.level
  type label = T.label
  type ty = Ty.ty

  datatype rw
    = RW
    | RO

  datatype enventry
    = VARentry of {access : access, ty : ty, rw : rw}
    | FUNentry of {level : level, label : label, formals : ty list, result : ty}

  type tenv = ty S.table
  type env = enventry S.table

  (* Helper function to put a key-value pair in the table *)
  fun enter ((name, ty), tbl) = S.enter (tbl, S.symbol name, ty)

  (* Helper function to make a FUNentry *)
  fun fentry (name, forms, res) =
      (name, FUNentry {level=Tr.outermost, label=T.namedlabel name,
                       formals=forms, result=res})

  val base_tenv = foldr enter S.empty [("int", Ty.INT), ("string", Ty.STRING)]

  val base_env = foldr enter S.empty
    [fentry ("print", [Ty.STRING], Ty.UNIT),
     fentry ("flush", [], Ty.UNIT),
     (* getchar actually maps to getch *)
     ("getchar", FUNentry {level=Tr.outermost, label=T.namedlabel "getch",
                           formals=[], result=Ty.STRING}),
     fentry ("ord", [Ty.STRING], Ty.INT),
     fentry ("chr", [Ty.INT], Ty.STRING),
     fentry ("size", [Ty.STRING], Ty.INT),
     fentry ("substring", [Ty.STRING, Ty.INT, Ty.INT], Ty.STRING),
     fentry ("concat", [Ty.STRING, Ty.STRING], Ty.STRING),
     fentry ("not", [Ty.INT], Ty.INT),
     fentry ("exit", [Ty.INT], Ty.UNIT)]
end
