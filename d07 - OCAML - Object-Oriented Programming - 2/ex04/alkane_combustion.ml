(* Helper functions to extract carbon and hydrogen counts from alkane formulas *)
let extract_carbon_count formula =
  try
    let c_index = String.index formula 'C' in
    let h_index = String.index formula 'H' in
    let c_part = String.sub formula (c_index + 1) (h_index - c_index - 1) in
    if c_part = "" then 1 else int_of_string c_part
  with Not_found -> 0

let extract_hydrogen_count formula =
  try
    let h_index = String.index formula 'H' in
    let h_part = String.sub formula (h_index + 1) (String.length formula - h_index - 1) in
    if h_part = "" then 1 else int_of_string h_part
  with Not_found -> 0

(* Alkane combustion reaction class *)
class alkane_combustion (alkanes_init:Alkane.alkane list) = object (self)
  inherit Reaction.reaction [] []
  
  method name = "Alkane Combustion"
  
  method get_start = 
    let oxygen_molecules = 
      List.map (fun alkane -> 
        let formula = alkane#formula in
        let n_c = extract_carbon_count formula in
        let n_h = extract_hydrogen_count formula in
        let o2_needed = n_c + (n_h / 4) in
        List.init o2_needed (fun _ -> new Molecule.carbon_dioxide) (* Using CO2 as placeholder for O2 *)
      ) alkanes_init |> List.flatten in
    (List.map (fun a -> (a :> Molecule.molecule)) alkanes_init) @ oxygen_molecules
  
  method get_result =
    let co2_molecules = 
      List.map (fun alkane -> 
        let formula = alkane#formula in
        let n_c = extract_carbon_count formula in
        List.init n_c (fun _ -> new Molecule.carbon_dioxide)
      ) alkanes_init |> List.flatten in
    let h2o_molecules = 
      List.map (fun alkane -> 
        let formula = alkane#formula in
        let n_h = extract_hydrogen_count formula in
        List.init (n_h / 2) (fun _ -> new Molecule.water)
      ) alkanes_init |> List.flatten in
    (List.map (fun m -> (m :> Molecule.molecule)) co2_molecules) @ 
    (List.map (fun m -> (m :> Molecule.molecule)) h2o_molecules)
end 