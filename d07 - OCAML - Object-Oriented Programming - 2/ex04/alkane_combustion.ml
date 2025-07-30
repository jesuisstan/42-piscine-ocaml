(* Exception for unbalanced reactions *)
exception Not_balanced

(* Alkane combustion reaction class *)
class alkane_combustion (alkanes_list : Alkane.alkane list) = object (self)
  inherit Reaction.reaction [] []
  
  method name : string = "Alkane Combustion"
  
  (* Compute total C and H atoms from the list of alkanes *)
  method private get_total_atoms : int * int =
    let total_c =
      List.fold_left (fun acc alk -> acc + alk#carbon_count) 0 alkanes_list
    in
    let total_h =
      List.fold_left (fun acc alk -> acc + alk#hydrogen_count) 0 alkanes_list
    in
    (total_c, total_h)
  
  method get_start : (Molecule.molecule * int) list =
    if not self#is_balanced then raise Not_balanced
    else
      let (total_c, total_h) = self#get_total_atoms in
      (* Calculate oxygen needed: (3n+1)/2 where n = carbon atoms *)
      (* Source: https://skill-lync.com/student-projects/Stoichiometric-Combustion-Calculator-for-Alkanes-Alkenes-and-Alkynes-using-MATLAB-29652 *)
      (* For C2H6: (3*2+1)/2 = 7/2 = 3.5, so we need to multiply everything by 2 *)
      let oxygen_needed_float = float_of_int (3 * total_c + 1) /. 2.0 in
      let oxygen_needed_int = int_of_float oxygen_needed_float in
      
      if oxygen_needed_float = float_of_int oxygen_needed_int then
        (* Even case: no fractional oxygen needed *)
        (List.map (fun alk -> ((alk :> Molecule.molecule), 1)) alkanes_list) @
        [(new Molecule.oxygen :> Molecule.molecule), oxygen_needed_int]
      else
        (* Odd case: need to multiply everything by 2 to get whole numbers *)
        (List.map (fun alk -> ((alk :> Molecule.molecule), 2)) alkanes_list) @
        [(new Molecule.oxygen :> Molecule.molecule), 2 * oxygen_needed_int + 1]
  
  method get_result : (Molecule.molecule * int) list =
    if not self#is_balanced then raise Not_balanced
    else
      let (total_c, total_h) = self#get_total_atoms in
      let oxygen_needed_float = float_of_int (3 * total_c + 1) /. 2.0 in
      let oxygen_needed_int = int_of_float oxygen_needed_float in
      
      if oxygen_needed_float = float_of_int oxygen_needed_int then
        (* Even case: normal coefficients *)
        [(new Molecule.carbon_dioxide :> Molecule.molecule), total_c;
         (new Molecule.water :> Molecule.molecule), total_h / 2]
      else
        (* Odd case: multiply everything by 2 *)
        [(new Molecule.carbon_dioxide :> Molecule.molecule), 2 * total_c;
         (new Molecule.water :> Molecule.molecule), total_h]
  
  method balance : Reaction.reaction =
    let (total_c, total_h) = self#get_total_atoms in
    let oxygen_needed_float = float_of_int (3 * total_c + 1) /. 2.0 in
    let oxygen_needed_int = int_of_float oxygen_needed_float in
    
    let balanced_reaction = object
      inherit Reaction.reaction [] []
      method name : string = "Balanced Alkane Combustion"
      
      method get_start : (Molecule.molecule * int) list =
        if oxygen_needed_float = float_of_int oxygen_needed_int then
          (* Even case: no fractional oxygen needed *)
          (List.map (fun alk -> ((alk :> Molecule.molecule), 1)) alkanes_list) @
          [(new Molecule.oxygen :> Molecule.molecule), oxygen_needed_int]
        else
          (* Odd case: need to multiply everything by 2 to get whole numbers *)
          (List.map (fun alk -> ((alk :> Molecule.molecule), 2)) alkanes_list) @
          [(new Molecule.oxygen :> Molecule.molecule), 2 * oxygen_needed_int + 1]
      
      method get_result : (Molecule.molecule * int) list =
        if oxygen_needed_float = float_of_int oxygen_needed_int then
          (* Even case: normal coefficients *)
          [(new Molecule.carbon_dioxide :> Molecule.molecule), total_c;
           (new Molecule.water :> Molecule.molecule), total_h / 2]
        else
          (* Odd case: multiply everything by 2 *)
          [(new Molecule.carbon_dioxide :> Molecule.molecule), 2 * total_c;
           (new Molecule.water :> Molecule.molecule), total_h]
      
      method is_balanced = true
      method balance = (self :> Reaction.reaction)
    end in
    (balanced_reaction :> Reaction.reaction)
  
  method is_balanced : bool = false
end 