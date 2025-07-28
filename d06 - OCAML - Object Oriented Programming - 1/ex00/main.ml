let () =
  let p = new People.people "Amy" in
  print_endline (p#to_string);
  p#talk;
  p#die

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -c people.ml                                                    *)
(* $ ocamlopt -o main people.cmx main.ml                                      *)
(* $ ./main                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "people.ml";;                                                       *)
(* # let p = new People.people "Amy";;                                        *)
(* val p : People.people = <obj>                                               *)
(* # p#to_string;;                                                             *)
(* - : string = "Amy"                                                         *)
(*                                                                            *)
(* ************************************************************************** *) 