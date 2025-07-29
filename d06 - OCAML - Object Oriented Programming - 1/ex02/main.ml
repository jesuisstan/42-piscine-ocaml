let () =
  let amy = new People.people "Amy" in
  let doc = new Doctor.doctor "The Doctor" 1200 amy in
  let dalek = new Dalek.dalek in

  print_endline "=== BATTLE SIMULATION ===";
  print_endline (dalek#to_string);
  dalek#talk;

  print_endline "\n--- Dalek attacks Amy ---";
  dalek#exterminate amy;
  print_endline (dalek#to_string);

  print_endline "\n--- Dalek restores shield ---";
  dalek#restore_shield;
  print_endline (dalek#to_string);

  print_endline "\n--- Dalek attacks Doctor (exterminate_doctor) ---";
  dalek#exterminate_doctor doc;
  print_endline (dalek#to_string);

  print_endline "\n--- Dalek restores shield again ---";
  dalek#restore_shield;
  print_endline (dalek#to_string);

  print_endline "\n--- Doctor talks ---";
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
(* ************************************************************************** *) 