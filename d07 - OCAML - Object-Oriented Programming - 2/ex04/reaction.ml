(* Virtual reaction class *)
class virtual reaction (reactants_init:Molecule.molecule list) (products_init:Molecule.molecule list) = object (self)
  method virtual name : string
  method virtual get_start : Molecule.molecule list
  method virtual get_result : Molecule.molecule list
  method reactants : Molecule.molecule list = reactants_init
  method products : Molecule.molecule list = products_init
  method to_string = Printf.sprintf "<reaction: name=%s>" self#name
  method equals (other : reaction) = self#name = other#name
end

(* Dummy reaction for testing *)
class dummy_reaction = object (self)
  inherit reaction [] []
  method name = "Dummy Reaction"
  method get_start = []
  method get_result = []
end 