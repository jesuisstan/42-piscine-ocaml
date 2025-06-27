(* ************************************************************************** *)
(*                                                                            *)
(*                               d06 - ex01                                   *)
(*                                                                            *)
(*   Test for class doctor and people                                         *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let amy = new People.people "Amy" in
  let doc = new Doctor.doctor "The Doctor" 1200 amy in
  print_endline (doc#to_string);
  doc#talk;
  amy#talk;
  amy#die

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -c people.ml                                                    *)
(* $ ocamlopt -c doctor.ml                                                    *)
(* $ ocamlopt -o main people.cmx doctor.cmx main.ml                           *)
(* $ ./main                                                                  *)
(*                                                                            *)
(* ************************************************************************** *) 