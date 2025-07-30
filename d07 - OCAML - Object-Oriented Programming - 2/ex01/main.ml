let () =
  let m1 = new Molecule.water in
  let m2 = new Molecule.carbon_dioxide in
  let m3 = new Molecule.ammonia in
  let m4 = new Molecule.sodium_chloride in
  let m5 = new Molecule.ozone in
  let ms = [m1; m2; m3; m4; m5] in
  List.iter (fun m -> print_endline (m#to_string)) ms;
  Printf.printf "Water equals Ozone? %b\n" (m1#equals m5);
  Printf.printf "Water equals Water? %b\n" (m1#equals (new Molecule.water))

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -c atom.ml                                                      *)
(* $ ocamlopt -c molecule.ml                                                  *)
(* $ ocamlopt -o main atom.cmx molecule.cmx main.ml                          *)
(* $ ./main                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "atom.ml";;                                                         *)
(* # #use "molecule.ml";;                                                     *)
(* # let water = new water;;                                                  *)
(* val water : water = <obj>                                                  *)
(* # water#to_string;;                                                        *)
(* - : string = "<molecule: name=Water, formula=H2O>"                        *)
(*                                                                            *)
(* ************************************************************************** *) 