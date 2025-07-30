(* Module for working with chemical reactions *)

(* Virtual atom class *)
class virtual atom = object (self)
  method virtual name : string
  method virtual symbol : string
  method virtual atomic_number : int
  method to_string =
    Printf.sprintf "<atom: name=%s, symbol=%s, atomic_number=%d>" self#name self#symbol self#atomic_number
  method equals (other : atom) =
    self#name = other#name && self#symbol = other#symbol && self#atomic_number = other#atomic_number
end

(* Create test atoms for demonstration *)
class hydrogen = object
  inherit atom
  method name = "Hydrogen"
  method symbol = "H"
  method atomic_number = 1
end

class carbon = object
  inherit atom
  method name = "Carbon"
  method symbol = "C"
  method atomic_number = 6
end

class oxygen = object
  inherit atom
  method name = "Oxygen"
  method symbol = "O"
  method atomic_number = 8
end

(* Virtual molecule class *)
class virtual molecule (name_init:string) (atoms_init:atom list) = object (self)
  method virtual name : string
  method virtual formula : string
  method atoms : atom list = atoms_init
  method to_string = Printf.sprintf "<molecule: name=%s, formula=%s>" self#name self#formula
  method equals (other : molecule) = self#formula = other#formula
end

(* Virtual reaction class *)
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

class dummy_reaction = object (self)
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
(* $ make                                                                     *)
(* $ ./reaction                                                               *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "reaction.ml";;                                                      *)
(* # let r = new dummy_reaction;;                                               *)
(* val r : dummy_reaction = <obj>                                               *)
(* # r#is_balanced;;                                                            *)
(* - : string = true                                                             *)
(*                                                                            *)
(* ************************************************************************** *) 