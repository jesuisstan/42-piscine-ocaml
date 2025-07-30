let () =
  let reaction = new Reaction.methane_combustion in
  print_endline (reaction#to_string);
  Printf.printf "Reaction name: %s\n" reaction#name;
  
  (* Show reactants and products *)
  Printf.printf "Reactants: %d types\n" (List.length reaction#get_start);
  Printf.printf "Products: %d types\n" (List.length reaction#get_result);
  
  (* Show detailed reactants *)
  print_endline "\nReactants (get_start):";
  List.iter (fun (molecule, count) ->
    Printf.printf "  %s x%d\n" molecule#to_string count
  ) reaction#get_start;
  
  (* Show detailed products *)
  print_endline "\nProducts (get_result):";
  List.iter (fun (molecule, count) ->
    Printf.printf "  %s x%d\n" molecule#to_string count
  ) reaction#get_result;
  
  (* Show if balanced *)
  Printf.printf "\nIs balanced: %b\n" reaction#is_balanced