(* Module for working with molecules *)

(* Function for Hill notation *)
let hill_notation (atoms : Atom.atom list) =
  let count = Hashtbl.create 10 in
  List.iter (fun (a : Atom.atom) ->
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
class virtual molecule (name_init:string) (atoms_init:Atom.atom list) = object (self)
  method virtual name : string
  method virtual formula : string
  method atoms : Atom.atom list = atoms_init
  method to_string = Printf.sprintf "<molecule: name=%s, formula=%s>" self#name self#formula
  method equals (other : molecule) = self#formula = other#formula
end

(* Concrete molecules *)
class water = object (self)
  inherit molecule "Water" [new Atom.hydrogen; new Atom.hydrogen; new Atom.oxygen]
  method name = "Water"
  method formula = hill_notation self#atoms
end

class carbon_dioxide = object (self)
  inherit molecule "Carbon dioxide" [new Atom.carbon; new Atom.oxygen; new Atom.oxygen]
  method name = "Carbon dioxide"
  method formula = hill_notation self#atoms
end

class ammonia = object (self)
  inherit molecule "Ammonia" ([new Atom.nitrogen] @ [new Atom.hydrogen; new Atom.hydrogen; new Atom.hydrogen])
  method name = "Ammonia"
  method formula = hill_notation self#atoms
end

class sodium_chloride = object (self)
  inherit molecule "Sodium chloride" [new Atom.sodium; new Atom.chlorine]
  method name = "Sodium chloride"
  method formula = hill_notation self#atoms
end

class ozone = object (self)
  inherit molecule "Ozone" [new Atom.oxygen; new Atom.oxygen; new Atom.oxygen]
  method name = "Ozone"
  method formula = hill_notation self#atoms
end 