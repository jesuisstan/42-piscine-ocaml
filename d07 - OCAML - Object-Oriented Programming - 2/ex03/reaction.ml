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

(* Example reaction: CH₄ + 2O₂ → CO₂ + 2H₂O *)
class methane_combustion = object (self)
  inherit reaction 
    [new Molecule.methane; new Molecule.ozone; new Molecule.ozone]  (* CH₄ + 2O₂ *)
    [new Molecule.carbon_dioxide; new Molecule.water; new Molecule.water]  (* CO₂ + 2H₂O *)
  method name : string = "Methane Combustion"
  method get_start : (Molecule.molecule * int) list = [
    (new Molecule.methane, 1);      (* CH₄ *)
    (new Molecule.ozone, 2)         (* 2O₂ *)
  ]
  method get_result : (Molecule.molecule * int) list = [
    (new Molecule.carbon_dioxide, 1);  (* CO₂ *)
    (new Molecule.water, 2)            (* 2H₂O *)
  ]
  method balance : reaction = (self :> reaction)  (* Type coercion: methane_combustion -> reaction *)
  method is_balanced : bool = true
end 