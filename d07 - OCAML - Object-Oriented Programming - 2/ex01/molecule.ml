(* Module for working with molecules *)

(* Function for Hill notation *)
let hill_notation : Atom.atom list -> string = fun (atoms : Atom.atom list) ->
  (* atom_counts - hash table with count of each atom type *)
  let atom_counts = Hashtbl.create 10 in
  List.iter (fun (current_atom : Atom.atom) ->
    (* current_atom - current atom in the loop *)
    (* atom_symbol - atom symbol (H, O, C, N, etc.) *)
    let atom_symbol = current_atom#symbol in
    Hashtbl.replace atom_counts atom_symbol (1 + (try Hashtbl.find atom_counts atom_symbol with Not_found -> 0))
  ) atoms;
  (* get_atom_count - function to get atom count by symbol *)
  let get_atom_count : string -> int = fun atom_symbol -> try Hashtbl.find atom_counts atom_symbol with Not_found -> 0 in
  (* all_atom_symbols - all atom symbols (with duplicates) *)
  let all_atom_symbols = Hashtbl.fold (fun symbol _ accumulator -> symbol :: accumulator) atom_counts [] in
  (* unique_atom_symbols - unique atom symbols *)
  let unique_atom_symbols = List.sort_uniq compare all_atom_symbols in
  (* sorted_symbols_for_hill_notation - symbols sorted according to Hill notation rules *)
  let sorted_symbols_for_hill_notation =
    (* other_elements - all elements except C and H *)
    let other_elements = List.filter (fun symbol -> symbol <> "C" && symbol <> "H") unique_atom_symbols |> List.sort compare in
    (if List.mem "C" unique_atom_symbols then ["C"] else []) @
    (if List.mem "H" unique_atom_symbols then ["H"] else []) @ other_elements
  in
  String.concat "" (List.map (fun atom_symbol ->
    (* atom_count - count of atoms of specific type *)
    let atom_count = get_atom_count atom_symbol in
    if atom_count = 1 then atom_symbol else atom_symbol ^ string_of_int atom_count
  ) sorted_symbols_for_hill_notation)

(* Virtual molecule class *)
class virtual molecule (name_init:string) (atoms_init:Atom.atom list) = object (self)
  method virtual name : string
  method virtual formula : string
  method atoms : Atom.atom list = atoms_init
  method to_string : string = Printf.sprintf "<molecule: name=%s, formula=%s>" self#name self#formula
  method equals : molecule -> bool = fun (other : molecule) -> self#formula = other#formula
end

(* Concrete molecules *)
class water = object (self)
  inherit molecule "Water" [new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen]
  method name : string = "Water"
  method formula : string = hill_notation self#atoms
end

class carbon_dioxide = object (self)
  inherit molecule "Carbon dioxide" [new Atom.carbon; new Atom.oxygen; new Atom.oxygen]
  method name : string = "Carbon dioxide"
  method formula : string = hill_notation self#atoms
end

class oxygen = object (self)
  inherit molecule "Oxygen" [new Atom.oxygen; new Atom.oxygen]
  method name : string = "Oxygen"
  method formula : string = hill_notation self#atoms
end

class ammonia = object (self)
  inherit molecule "Ammonia" ([new Atom.nitrogen] @ [new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen])
  method name : string = "Ammonia"
  method formula : string = hill_notation self#atoms
end

class sodium_chloride = object (self)
  inherit molecule "Sodium chloride" [new Atom.sodium; new Atom.chlorine]
  method name : string = "Sodium chloride"
  method formula : string = hill_notation self#atoms
end

class ozone = object (self)
  inherit molecule "Ozone" [new Atom.oxygen; new Atom.oxygen; new Atom.oxygen]
  method name : string = "Ozone"
  method formula : string = hill_notation self#atoms
end

(* Bonus molecules - 5 additional real molecules *)
class methane = object (self)
  inherit molecule "Methane" [new Atom.carbon; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen]
  method name : string = "Methane"
  method formula : string = hill_notation self#atoms
end

class sulfuric_acid = object (self)
  inherit molecule "Sulfuric acid" [new Atom.hydrogen; new Atom.hydrogen; new Atom.sulfur; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen]
  method name : string = "Sulfuric acid"
  method formula : string = hill_notation self#atoms
end

class glucose = object (self)
  inherit molecule "Glucose" [new Atom.carbon; new Atom.carbon; new Atom.carbon; new Atom.carbon; new Atom.carbon; new Atom.carbon; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen]
  method name : string = "Glucose"
  method formula : string = hill_notation self#atoms
end

class calcium_carbonate = object (self)
  inherit molecule "Calcium carbonate" [new Atom.calcium; new Atom.carbon; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen]
  method name : string = "Calcium carbonate"
  method formula : string = hill_notation self#atoms
end

class iron_oxide = object (self)
  inherit molecule "Iron oxide" [new Atom.iron; new Atom.iron; new Atom.iron; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen; new Atom.oxygen]
  method name : string = "Iron oxide"
  method formula : string = hill_notation self#atoms
end 