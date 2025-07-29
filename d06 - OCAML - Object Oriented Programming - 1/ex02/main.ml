let () =
  let amy = new People.people "Amy" in
  let doc = new Doctor.doctor "The Doctor" 1200 amy in
  let dalek = new Dalek.dalek in
  print_endline (dalek#to_string);
  dalek#talk;
  dalek#exterminate amy;
  print_endline (dalek#to_string);
  dalek#die;
  doc#talk;

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -c people.ml                                                    *)
(* $ ocamlopt -c doctor.ml                                                    *)
(* $ ocamlopt -c dalek.ml                                                     *)
(* $ ocamlopt -o main people.cmx doctor.cmx dalek.cmx main.ml                 *)
(* $ ./main                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                    *)
(* # #use "people.ml";;                                                       *)
(* # #use "doctor.ml";;                                                        *)
(* # #use "dalek.ml";;                                                         *)
(* # let dalek = new Dalek.dalek;;                                             *)
(* val dalek : Dalek.dalek = <obj>                                              *)
(* # dalek#to_string;;                                                          *)
(* - : string = "DalekXXX"                                                     *)
(*                                                                            *)
(* ************************************************************************** *) 