let () =
  let dummy = new Reaction.dummy_reaction in
  print_endline (dummy#to_string);
  Printf.printf "Dummy reaction name: %s\n" dummy#name;
  Printf.printf "Dummy reaction start: %d molecules\n" (List.length dummy#get_start);
  Printf.printf "Dummy reaction result: %d molecules\n" (List.length dummy#get_result)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -c atom.ml                                                      *)
(* $ ocamlopt -c molecule.ml                                                  *)
(* $ ocamlopt -c reaction.ml                                                  *)
(* $ ocamlopt -o main atom.cmx molecule.cmx reaction.cmx main.ml             *)
(* $ ./main                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "atom.ml";;                                                         *)
(* # #use "molecule.ml";;                                                     *)
(* # #use "reaction.ml";;                                                     *)
(* # let dummy = new dummy_reaction;;                                        *)
(* val dummy : dummy_reaction = <obj>                                        *)
(* # dummy#to_string;;                                                        *)
(* - : string = "<reaction: name=Dummy Reaction>"                            *)
(*                                                                            *)
(* ************************************************************************** *) 