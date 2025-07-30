let () =
  let methane = new Alkane.alkane 1 in
  
  print_endline "=== Testing Alkane Combustion ===";
  
  (* Create unbalanced combustion *)
  let combustion = new Alkane_combustion.alkane_combustion [methane] in
  print_endline (combustion#to_string);
  Printf.printf "Is balanced? %b\n" combustion#is_balanced;
  
  (* Try to get start/result from unbalanced reaction *)
  (try 
    ignore (combustion#get_start);
    print_endline "ERROR: Should have thrown exception!"
  with Alkane_combustion.Not_balanced -> 
    print_endline "Correctly threw Not_balanced exception for get_start");
  
  (try 
    ignore (combustion#get_result);
    print_endline "ERROR: Should have thrown exception!"
  with Alkane_combustion.Not_balanced -> 
    print_endline "Correctly threw Not_balanced exception for get_result");
  
  (* Balance the reaction *)
  let balanced_combustion = combustion#balance in
  print_endline (balanced_combustion#to_string);
  Printf.printf "Is balanced after balance? %b\n" balanced_combustion#is_balanced;
  
  (* Now we can get start and result *)
  let start = balanced_combustion#get_start in
  let result = balanced_combustion#get_result in
  
  Printf.printf "Start molecules: %d\n" (List.length start);
  List.iter (fun (molecule, count) -> 
    Printf.printf "  %s x%d\n" molecule#to_string count
  ) start;

  Printf.printf "Result molecules: %d\n" (List.length result);
  List.iter (fun (molecule, count) -> 
    Printf.printf "  %s x%d\n" molecule#to_string count
  ) result
