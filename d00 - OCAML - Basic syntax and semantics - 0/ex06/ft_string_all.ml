(* ************************************************************************** *)
(*                                                                            *)
(* ft_string_all.ml                                                          *)
(* Exercise 06: Check if all characters satisfy predicate                    *)
(* Allowed functions: String.get and String.length                          *)
(*                                                                            *)
(* ************************************************************************** *)

(* Returns true if all characters in the string satisfy the predicate function.
   Uses recursion to check each character. *)

let ft_string_all f str =
  let len = String.length str in
  let rec check_from i =
    if i >= len then true
    else if not (f (String.get str i)) then false
    else check_from (i + 1)
  in
  check_from 0

(* Test cases *)
let () =
  let is_digit c = c >= '0' && c <= '9' in
  let is_alpha c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') in
  
  (* Test with digits *)
  print_string "Testing '0123456789': ";
  print_string (string_of_bool (ft_string_all is_digit "0123456789"));
  print_char '\n';
  
  (* Test with mixed characters *)
  print_string "Testing 'O12EAS67B9': ";
  print_string (string_of_bool (ft_string_all is_digit "O12EAS67B9"));
  print_char '\n';
  
  (* Additional test with letters *)
  print_string "Testing 'OCaml': ";
  print_string (string_of_bool (ft_string_all is_alpha "OCaml"));
  print_char '\n'

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_string_all.ml -o ft_string_all                             *)
(* $ ./ft_string_all                                                         *)
(*                                                                            *)
(* ************************************************************************** *) 