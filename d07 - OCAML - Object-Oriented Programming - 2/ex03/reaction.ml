(* ************************************************************************** *)
(*                                                                            *)
(*                               d07 - ex03                                   *)
(*                                                                            *)
(*   Virtual class: reaction                                                  *)
(*                                                                            *)
(* ************************************************************************** *)

open Ex01_molecule

class virtual reaction = object
  method virtual get_start : (molecule * int) list
  method virtual get_result : (molecule * int) list
  method virtual balance : reaction
  method virtual is_balanced : bool
end

(* ************************************************************************** *)
(*                                                                            *)
(* Test code                                                                  *)
(*                                                                            *)
(* ************************************************************************** *)

class dummy_reaction = object
  inherit reaction
  method get_start = []
  method get_result = []
  method balance = (self :> reaction)
  method is_balanced = true
end

let () =
  let r = new dummy_reaction in
  Printf.printf "Is dummy reaction balanced? %b\n" (r#is_balanced)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o reaction ex00/atom.ml ex01/molecule.ml reaction.ml           *)
(* $ ./reaction                                                               *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ex00/atom.ml";;                                                    *)
(* # #use "ex01/molecule.ml";;                                                 *)
(* # #use "reaction.ml";;                                                      *)
(* # let r = new dummy_reaction;;                                               *)
(* val r : dummy_reaction = <obj>                                               *)
(* # r#is_balanced;;                                                            *)
(* - : bool = true                                                             *)
(*                                                                            *)
(* ************************************************************************** *) 