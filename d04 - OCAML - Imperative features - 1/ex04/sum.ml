let sum a b = a +. b

let () =
  Printf.printf "sum 1.0 2.0 = %f\n" (sum 1.0 2.0);
  Printf.printf "sum (-3.5) 4.5 = %f\n" (sum (-3.5) 4.5);
  Printf.printf "sum 0.0 0.0 = %f\n" (sum 0.0 0.0)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o sum sum.ml                                                   *)
(* $ ./sum                                                                    *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "sum.ml";;                                                          *)
(* # sum 1.0 2.0;;                                                             *)
(* - : float = 3.                                                              *)
(* # sum (-3.5) 4.5;;                                                          *)
(* - : float = 1.                                                              *)
(*                                                                            *)
(* ************************************************************************** *) 