let () =
  let methane = new Alkane.alkane 1 4 in
  let ethane = new Alkane.alkane 2 6 in
  
  let combustion = new Alkane_combustion.alkane_combustion [methane; ethane] in
  
  print_endline (combustion#to_string);
  Printf.printf "Combustion name: %s\n" combustion#name;
  
  let reactants = combustion#get_start in
  let products = combustion#get_result in
  
  Printf.printf "Number of reactants: %d\n" (List.length reactants);
  Printf.printf "Number of products: %d\n" (List.length products);
  
  Printf.printf "Reactants:\n";
  List.iter (fun r -> Printf.printf "  %s\n" r#to_string) reactants;
  
  Printf.printf "Products:\n";
  List.iter (fun p -> Printf.printf "  %s\n" p#to_string) products

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -c atom.ml                                                      *)
(* $ ocamlopt -c molecule.ml                                                  *)
(* $ ocamlopt -c alkane.ml                                                    *)
(* $ ocamlopt -c reaction.ml                                                  *)
(* $ ocamlopt -c alkane_combustion.ml                                         *)
(* $ ocamlopt -o main atom.cmx molecule.cmx alkane.cmx reaction.cmx alkane_combustion.cmx main.ml *)
(* $ ./main                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "atom.ml";;                                                         *)
(* # #use "molecule.ml";;                                                     *)
(* # #use "alkane.ml";;                                                       *)
(* # #use "reaction.ml";;                                                     *)
(* # #use "alkane_combustion.ml";;                                            *)
(* # let methane = new alkane 1 4;;                                          *)
(* # let combustion = new alkane_combustion [methane];;                      *)
(* # combustion#to_string;;                                                   *)
(* - : string = "<reaction: name=Alkane Combustion>"                         *)
(*                                                                            *)
(* ************************************************************************** *) 