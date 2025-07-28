let () =
  let amy = new People.people "Amy" in
  let doc = new Doctor.doctor "The Doctor" 1200 amy in
  print_endline (doc#to_string);
  doc#talk;
  doc#travel_in_time 2013 1963;
  doc#use_sonic_screwdriver;
  
  (* Note: regenerate method is private and cannot be tested from outside the class *)
  (* This is correct according to the subject requirements *)
  
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
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                    *)
(* # #use "people.ml";;                                                       *)
(* # #use "doctor.ml";;                                                        *)
(* # let amy = new People.people "Amy";;                                       *)
(* val amy : People.people = <obj>                                              *)
(* # let doc = new Doctor.doctor "The Doctor" 1200 amy;;                       *)
(* val doc : Doctor.doctor = <obj>                                              *)
(* # doc#to_string;;                                                            *)
(* - : string = "The Doctor, 1200, Amy"                                       *)
(*                                                                            *)
(* ************************************************************************** *) 