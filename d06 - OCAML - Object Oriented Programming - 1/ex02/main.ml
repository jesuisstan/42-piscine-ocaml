(* ************************************************************************** *)
(*                                                                            *)
(*                               d06 - ex02                                   *)
(*                                                                            *)
(*   Test for class dalek, doctor, people                                     *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let amy = new People.people "Amy" in
  let doc = new Doctor.doctor "The Doctor" 1200 amy in
  let dalek = new Dalek.dalek "DalekSec" in
  print_endline (dalek#to_string);
  dalek#talk;
  dalek#exterminate amy;
  dalek#die;
  doc#talk;
  amy#talk;
  amy#die

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
(* ************************************************************************** *) 