(* Alkane class inheriting from molecule *)
class alkane (n_c:int) (n_h:int) = object (self)
  inherit Molecule.molecule "Alkane" 
    (List.init n_c (fun _ -> new Atom.carbon) @ 
     List.init n_h (fun _ -> new Atom.hydrogen))
  method name = "Alkane"
  method formula = Molecule.hill_notation self#atoms
  method carbon_count = n_c
  method hydrogen_count = n_h
end 