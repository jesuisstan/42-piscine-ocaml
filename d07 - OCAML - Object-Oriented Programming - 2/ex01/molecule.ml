(* Module for working with molecules *)

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

class nitrogen = object
  inherit atom
  method name = "Nitrogen"
  method symbol = "N"
  method atomic_number = 7
end

class sodium = object
  inherit atom
  method name = "Sodium"
  method symbol = "Na"
  method atomic_number = 11
end

class chlorine = object
  inherit atom
  method name = "Chlorine"
  method symbol = "Cl"
  method atomic_number = 17
end

(* Function for Hill notation *)
let hill_notation (atoms : atom list) =
  let count = Hashtbl.create 10 in
  List.iter (fun (a : atom) ->
    let sym = a#symbol in
    Hashtbl.replace count sym (1 + (try Hashtbl.find count sym with Not_found -> 0))
  ) atoms;
  let get sym = try Hashtbl.find count sym with Not_found -> 0 in
  let all_syms = Hashtbl.fold (fun k _ acc -> k :: acc) count [] in
  let uniq_syms = List.sort_uniq compare all_syms in
  let sorted =
    let rest = List.filter (fun s -> s <> "C" && s <> "H") uniq_syms |> List.sort compare in
    (if List.mem "C" uniq_syms then ["C"] else []) @
    (if List.mem "H" uniq_syms then ["H"] else []) @ rest
  in
  String.concat "" (List.map (fun s ->
    let n = get s in
    if n = 1 then s else s ^ string_of_int n
  ) sorted)

(* Virtual molecule class *)
class virtual molecule (name_init:string) (atoms_init:atom list) = object (self)
  method virtual name : string
  method virtual formula : string
  method atoms : atom list = atoms_init
  method to_string = Printf.sprintf "<molecule: name=%s, formula=%s>" self#name self#formula
  method equals (other : molecule) = self#formula = other#formula
end

(* Concrete molecules *)
class water = object (self)
  inherit molecule "Water" [new hydrogen; new hydrogen; new oxygen]
  method name = "Water"
  method formula = hill_notation self#atoms
end

class carbon_dioxide = object (self)
  inherit molecule "Carbon dioxide" [new carbon; new oxygen; new oxygen]
  method name = "Carbon dioxide"
  method formula = hill_notation self#atoms
end

class ammonia = object (self)
  inherit molecule "Ammonia" ([new nitrogen] @ [new hydrogen; new hydrogen; new hydrogen])
  method name = "Ammonia"
  method formula = hill_notation self#atoms
end

class sodium_chloride = object (self)
  inherit molecule "Sodium chloride" [new sodium; new chlorine]
  method name = "Sodium chloride"
  method formula = hill_notation self#atoms
end

class ozone = object (self)
  inherit molecule "Ozone" [new oxygen; new oxygen; new oxygen]
  method name = "Ozone"
  method formula = hill_notation self#atoms
end

(* ************************************************************************** *)
(*                                                                            *)
(* Test code                                                                  *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let m1 = new water in
  let m2 = new carbon_dioxide in
  let m3 = new ammonia in
  let m4 = new sodium_chloride in
  let m5 = new ozone in
  let ms = [m1; m2; m3; m4; m5] in
  List.iter (fun m -> print_endline (m#to_string)) ms;
  Printf.printf "Water equals Ozone? %b\n" (m1#equals m5);
  Printf.printf "Water equals Water? %b\n" (m1#equals (new water))

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ make                                                                     *)
(* $ ./molecule                                                              *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "molecule.ml";;                                                      *)
(* # let water = new water;;                                                   *)
(* val water : water = <obj>                                                   *)
(* # water#to_string;;                                                         *)
(* - : string = "<molecule: name=Water, formula=H2O>"                        *)
(* # let co2 = new carbon_dioxide;;                                            *)
(* val c : carbon_dioxide = <obj>                                              *)
(* # co2#formula;;                                                             *)
(* - : string = "CO2"                                                        *)
(*                                                                            *)
(* ************************************************************************** *) 