let ft_test_sign n =
  if n >= 0 then
    print_endline "positive"
  else
    print_endline "negative"

let () =
  ft_test_sign 42;
  ft_test_sign 0;
  ft_test_sign (-42)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_test_sign.ml -o ft_test_sign                                 *)
(* $ ./ft_test_sign                                                           *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                    *)
(* # #use "ft_test_sign.ml";;                                                 *)
(* # ft_test_sign 42;;                                                        *)
(* positive                                                                   *)
(* # ft_test_sign 0;;                                                         *)
(* positive                                                                   *)
(*                                                                            *)
(* Utop:                                                                      *)
(* $ utop                                                                     *)
(* # #use "ft_test_sign.ml";;                                                 *)
(* # ft_test_sign 42;;                                                        *)
(* positive                                                                   *)
(* # ft_test_sign 0;;                                                         *)
(* positive                                                                   *)
(* ************************************************************************** *)
