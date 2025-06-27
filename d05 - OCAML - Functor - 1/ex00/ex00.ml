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
  let set = List.fold_right StringSet.add ["foo"; "bar"; "baz"; "quux"] StringSet.empty in
  StringSet.iter print_endline set;
  print_endline (StringSet.fold (^) set "")

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o ex00 ex00.ml                                                 *)
(* $ ./ex00                                                                  *)
(*                                                                            *)
(* ************************************************************************** *) 