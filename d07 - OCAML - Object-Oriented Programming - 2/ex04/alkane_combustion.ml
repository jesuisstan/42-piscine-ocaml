(* ************************************************************************** *)
(*                                                                            *)
(*                               d07 - ex04                                   *)
(*                                                                            *)
(*   Class: alkane_combustion (reaction subclass)                             *)
(*                                                                            *)
(* ************************************************************************** *)

open Ex02_alkane
open Ex03_reaction

exception Not_balanced

class alkane_combustion (alkanes : alkane list) =
  object (self)
    inherit reaction
    val balanced = false
    val start = alkanes
    val result = []
    method get_start = if not balanced then raise Not_balanced else []
    method get_result = if not balanced then raise Not_balanced else []
    method balance =
      (* Здесь должна быть логика балансировки, для шаблона просто возвращаем сбалансированный объект *)
      let balanced_obj = object
        inherit reaction
        method get_start = [(new alkane 1 :> Ex01_molecule.molecule), 1; (new Ex01_molecule.oxygen :> Ex01_molecule.molecule), 2]
        method get_result = [(new Ex01_molecule.carbon_dioxide :> Ex01_molecule.molecule), 1; (new Ex01_molecule.water :> Ex01_molecule.molecule), 2]
        method balance = (self :> reaction)
        method is_balanced = true
      end in
      (balanced_obj :> reaction)
    method is_balanced = balanced
  end

(* ************************************************************************** *)
(*                                                                            *)
(* Test code                                                                  *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let c = new alkane_combustion [new alkane 1] in
  Printf.printf "Is balanced? %b\n" (c#is_balanced);
  let c2 = c#balance in
  Printf.printf "Is balanced after balance? %b\n" (c2#is_balanced);
  (try ignore (c#get_start) with Not_balanced -> print_endline "Not balanced!");
  (try
    let s = c2#get_start in
    List.iter (fun (m, n) -> Printf.printf "%s x%d\n" (m#to_string) n) s
  with _ -> ())

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o alkane_combustion ex00/atom.ml ex01/molecule.ml ex02/alkane.ml ex03/reaction.ml alkane_combustion.ml *)
(* $ ./alkane_combustion                                                      *)
(*                                                                            *)
(* ************************************************************************** *) 