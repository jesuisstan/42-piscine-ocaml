(* Module for working with alkane combustion reactions *)

exception Not_balanced

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

(* Alkane class *)
exception Invalid_alkane_n of int

class alkane n =
  object (self)
    inherit molecule (Printf.sprintf "Alkane_%d" n) []
    val n_c = n
    val n_h = 2 * n + 2
    method name =
      match n with
      | 1 -> "Methane"
      | 2 -> "Ethane"
      | 8 -> "Octane"
      | _ -> Printf.sprintf "Alkane_%d" n
    method formula =
      if n < 1 || n > 12 then raise (Invalid_alkane_n n)
      else Printf.sprintf "C%dH%d" n_c n_h
    method to_string = Printf.sprintf "<alkane: name=%s, formula=%s>" self#name self#formula
    method equals (other : alkane) = self#formula = other#formula
  end

(* Molecules for reaction products *)
class water = object (self)
  inherit molecule "Water" [new hydrogen; new hydrogen; new oxygen]
  method name = "Water"
  method formula = "H2O"
end

class carbon_dioxide = object (self)
  inherit molecule "Carbon dioxide" [new carbon; new oxygen; new oxygen]
  method name = "Carbon dioxide"
  method formula = "CO2"
end

class molecular_oxygen = object (self)
  inherit molecule "Molecular oxygen" [new oxygen; new oxygen]
  method name = "Molecular oxygen"
  method formula = "O2"
end

(* Alkane combustion class *)
class alkane_combustion (alkanes : alkane list) =
  object (self)
    inherit reaction
    val balanced = false
    val start = alkanes
    val result = []
    
    method get_start = 
      if not balanced then raise Not_balanced 
      else 
        let total_c = List.fold_left (fun acc a -> acc + 1) 0 alkanes in
        let total_h = List.fold_left (fun acc a -> acc + 4) 0 alkanes in
        let o2_needed = (total_c * 2 + total_h / 2) in
        [(new alkane 1 :> molecule), 1; (new molecular_oxygen :> molecule), o2_needed]
    
    method get_result = 
      if not balanced then raise Not_balanced 
      else 
        let total_c = List.fold_left (fun acc a -> acc + 1) 0 alkanes in
        let total_h = List.fold_left (fun acc a -> acc + 4) 0 alkanes in
        [(new carbon_dioxide :> molecule), total_c; (new water :> molecule), total_h / 2]
    
    method balance =
      let balanced_obj = object
        inherit reaction
        method get_start = self#get_start
        method get_result = self#get_result
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
(* $ make                                                                     *)
(* $ ./alkane_combustion                                                      *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "alkane_combustion.ml";;                                              *)
(* # let c = new alkane_combustion [new alkane 1];;                              *)
(* val c : alkane_combustion = <obj>                                             *)
(* # c#is_balanced;;                                                             *)
(* - : bool = false                                                             *)
(*                                                                            *)
(* ************************************************************************** *) 