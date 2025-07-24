(* ************************************************************************** *)
(*                                                                            *)
(* ft_string_all_with_predicates.ml                                         *)
(* Exercise 06: Check if all characters satisfy predicate                    *)
(* Version with global predicates for interactive testing                    *)
(*                                                                            *)
(* ************************************************************************** *)

(* Returns true if all characters in the string satisfy the predicate function *)
let ft_string_all f str =
  let len = String.length str in
  let rec check_from i =
    if i >= len then true
    else if not (f (String.get str i)) then false
    else check_from (i + 1)
  in
  check_from 0

(* Global predicate functions - available after #use *)
let is_digit c = c >= '0' && c <= '9'
let is_alpha c = (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z')
let is_alphanum c = is_digit c || is_alpha c
let is_lowercase c = c >= 'a' && c <= 'z'
let is_uppercase c = c >= 'A' && c <= 'Z'

(* Test cases *)
let () =
  print_string "Testing '0123456789': ";
  print_string (string_of_bool (ft_string_all is_digit "0123456789"));
  print_char '\n';
  
  print_string "Testing 'O12EAS67B9': ";
  print_string (string_of_bool (ft_string_all is_digit "O12EAS67B9"));
  print_char '\n';
  
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
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ft_string_all.ml";;                                               *)
(* # ft_string_all is_digit "0123456789";;                                   *)
(* - : bool = true                                                             *)
(* # ft_string_all is_alpha "OCaml";;                                         *)
(* - : bool = true                                                             *)
(*                                                                            *)
(* ************************************************************************** *) 