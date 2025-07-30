(* Alkane class inheriting from molecule *)
class alkane (n:int) = object (self)
  inherit Molecule.molecule "Alkane" 
    (List.init n (fun _ -> new Atom.carbon) @ 
     List.init (2 * n + 2) (fun _ -> new Atom.hydrogen))
  method name : string = "Alkane"
  method formula : string = Molecule.hill_notation self#atoms
  method carbon_count : int = n
  method hydrogen_count : int = 2 * n + 2
end

(* Concrete alkane classes *)
class methane = object (self)
  inherit alkane 1
  method name : string = "Methane"
end

class ethane = object (self)
  inherit alkane 2
  method name : string = "Ethane"
end

class octane = object (self)
  inherit alkane 8
  method name : string = "Octane"
end 