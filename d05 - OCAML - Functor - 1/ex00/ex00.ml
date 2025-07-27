(* ************************************************************************** *)
(*                                                                            *)
(*                               d05 - ex00                                   *)
(*                                                                            *)
(*   The Set module and the Set.Make functor                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* This exercise demonstrates the use of the Set.Make functor to create a set of strings. *)

module StringSet = Set.Make(String)

let () =
  let set = List.fold_right StringSet.add ["foo"; "bar"; "baz"; "qux"] StringSet.empty in
  StringSet.iter print_endline set;
  print_endline (StringSet.fold (^) set "")

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ex00.ml && ./a.out                                              *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ex00.ml";;                                                         *)
(* # let set = List.fold_right StringSet.add ["foo"; "bar"; "baz"] StringSet.empty;; *)
(* val set : StringSet.t = <abstr>                                             *)
(* # StringSet.cardinal set;;                                                  *)
(* - : int = 3                                                                *)
(*                                                                            *)
(* ************************************************************************** *) 