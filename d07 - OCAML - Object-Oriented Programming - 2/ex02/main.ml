let () =
  let methane = new Alkane.methane in
  let ethane = new Alkane.ethane in
  let octane = new Alkane.octane in
  
  let alkanes = [methane; ethane; octane] in
  
  List.iter (fun alkane -> print_endline (alkane#to_string)) alkanes;
  
  Printf.printf "Methane carbon count: %d\n" methane#carbon_count;
  Printf.printf "Ethane hydrogen count: %d\n" ethane#hydrogen_count;
  Printf.printf "Octane formula: %s\n" octane#formula

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -c atom.ml                                                      *)
(* $ ocamlopt -c molecule.ml                                                  *)
(* $ ocamlopt -c alkane.ml                                                    *)
(* $ ocamlopt -o main atom.cmx molecule.cmx alkane.cmx main.ml               *)
(* $ ./main                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "atom.ml";;                                                         *)
(* # #use "molecule.ml";;                                                     *)
(* # #use "alkane.ml";;                                                       *)
(* # let methane = new methane;;                                              *)
(* val methane : methane = <obj>                                              *)
(* # methane#to_string;;                                                      *)
(* - : string = "<molecule: name=Methane, formula=CH4>"                       *)
(*                                                                            *)
(* ************************************************************************** *) 