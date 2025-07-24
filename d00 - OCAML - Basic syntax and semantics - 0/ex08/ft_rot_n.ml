(* ************************************************************************** *)
(*                                                                            *)
(* ft_rot_n.ml                                                               *)
(* Exercise 08: Rotate characters by n positions                             *)
(* Allowed functions: char_of_int, int_of_char and String.map              *)
(*                                                                            *)
(* ************************************************************************** *)

(* Rotates alphabetical characters by n positions.
   Non-alphabetical characters remain unchanged.
   Preserves case of letters. *)

let ft_rot_n n str =
  let rotate_char c =
    let base = if c >= 'a' && c <= 'z' then int_of_char 'a'
               else if c >= 'A' && c <= 'Z' then int_of_char 'A'
               else -1 in
    if base = -1 then c
    else
      let pos = (int_of_char c) - base in  (* Get position 0-25 *)
      let new_pos = (pos + n) mod 26 in    (* Rotate and wrap *)
      char_of_int (base + new_pos)         (* Convert back to char *)
  in
  String.map rotate_char str

(* Test cases *)
let () =
  let test_rot_n n str =
    print_string ("Testing rot " ^ string_of_int n ^ " on \"" ^ str ^ "\": ");
    print_string (ft_rot_n n str);
    print_char '\n'
  in
  test_rot_n 1 "abcdefghijklmnopqrstuvwxyz";  (* Should rotate by 1 *)
  test_rot_n 13 "abcdefghijklmnopqrstuvwxyz"; (* Should rotate by 13 *)
  test_rot_n 42 "0123456789";                 (* Should not change digits *)
  test_rot_n 2 "OI2EAS67B9";                  (* Should rotate letters only *)
  test_rot_n 0 "Damned !";                    (* Should not change anything *)
  test_rot_n 42 "";                           (* Should handle empty string *)
  test_rot_n 1 "NBzlk qnbjr !"                (* Should print "OCaml rocks !" *)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_rot_n.ml -o ft_rot_n                                       *)
(* $ ./ft_rot_n                                                              *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ft_rot_n.ml";;                                                    *)
(* # ft_rot_n 1 "abcdefghijklmnopqrstuvwxyz";;                               *)
(* - : string = "bcdefghijklmnopqrstuvwxyza"                                 *)
(* # ft_rot_n 13 "abcdefghijklmnopqrstuvwxyz";;                              *)
(* - : string = "nopqrstuvwxyzabcdefghijklm"                                 *)
(*                                                                            *)
(* ************************************************************************** *) 