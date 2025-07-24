let jokes = [|
  "Why did the OCaml programmer cross the road? To get to the other side-effect!";
  "Why do functional programmers confuse Halloween and Christmas? Because OCT 31 == DEC 25.";
  "A lambda walks into a bar. The bartender says: 'Sorry, we don't serve functions here.'";
  "Why was the JavaScript developer sad? Because he didn't know how to 'null' his feelings.";
  "Why did the computer get cold? Because it forgot to close its Windows!"
|]

let () =
  Random.self_init ();
  let idx = Random.int (Array.length jokes) in
  print_endline jokes.(idx)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o jokes jokes.ml                                               *)
(* $ ./jokes                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "jokes.ml";;                                                        *)
(* # Random.self_init ();;                                                     *)
(* # let idx = Random.int (Array.length jokes);;                               *)
(* val idx : int = 2                                                           *)
(* # print_endline jokes.(idx);;                                               *)
(* Why do functional programmers confuse Halloween and Christmas? Because OCT 31 == DEC 25. *)
(*                                                                            *)
(* ************************************************************************** *) 