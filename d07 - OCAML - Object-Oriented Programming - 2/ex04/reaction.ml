(* Virtual reaction class *)
class virtual reaction (reactants_init:Molecule.molecule list) (products_init:Molecule.molecule list) = object (self)
  method virtual name : string
  method virtual get_start : (Molecule.molecule * int) list
  method virtual get_result : (Molecule.molecule * int) list
  method virtual balance : reaction
  method virtual is_balanced : bool
  method reactants : Molecule.molecule list = reactants_init
  method products : Molecule.molecule list = products_init
  method to_string : string = Printf.sprintf "<reaction: name=%s>" self#name
  method equals : reaction -> bool = fun (other : reaction) -> self#name = other#name
end