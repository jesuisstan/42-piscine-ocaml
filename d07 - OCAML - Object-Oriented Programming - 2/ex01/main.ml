(* Test molecule classes *)

let () =
  print_endline "=== Testing Molecule Classes ===";
  
  (* Test basic molecules *)
  let water = new Molecule.water in
  let co2 = new Molecule.carbon_dioxide in
  let nh3 = new Molecule.ammonia in
  let nacl = new Molecule.sodium_chloride in
  let o3 = new Molecule.ozone in
  
  print_endline (water#to_string);
  print_endline (co2#to_string);
  print_endline (nh3#to_string);
  print_endline (nacl#to_string);
  print_endline (o3#to_string);
  
  (* Test bonus molecules *)
  let ch4 = new Molecule.methane in
  let h2so4 = new Molecule.sulfuric_acid in
  let c6h12o6 = new Molecule.glucose in
  let caco3 = new Molecule.calcium_carbonate in
  let fe3o4 = new Molecule.iron_oxide in
  
  print_endline "\n=== Bonus Molecules ===";
  print_endline (ch4#to_string);
  print_endline (h2so4#to_string);
  print_endline (c6h12o6#to_string);
  print_endline (caco3#to_string);
  print_endline (fe3o4#to_string);
  
  (* Test equals method *)
  print_endline "\n=== Testing Equals Method ===";
  let water2 = new Molecule.water in
  print_endline (Printf.sprintf "Water equals Water: %b" (water#equals water2));
  print_endline (Printf.sprintf "Water equals CO2: %b" (water#equals co2));
  
  (* Test Hill notation *)
  print_endline "\n=== Testing Hill Notation ===";
  print_endline (Printf.sprintf "Water formula: %s" water#formula);
  print_endline (Printf.sprintf "CO2 formula: %s" co2#formula);
  print_endline (Printf.sprintf "Ammonia formula: %s" nh3#formula);
  print_endline (Printf.sprintf "Glucose formula: %s" c6h12o6#formula) 