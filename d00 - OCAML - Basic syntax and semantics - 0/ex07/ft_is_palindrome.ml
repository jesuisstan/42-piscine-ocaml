(* ************************************************************************** *)
(*                                                                            *)
(* ft_is_palindrome.ml                                                       *)
(* Exercise 07: Check if string is palindrome                                *)
(* Allowed functions: String.get and String.length                          *)
(*                                                                            *)
(* ************************************************************************** *)

(* Returns true if the string is a palindrome (reads the same forwards and backwards).
   Uses recursion to compare characters from both ends moving inward. *)

let ft_is_palindrome str =
  let len = String.length str in
  let rec is_palindrome_from i j =
    if i >= j then true
    else if String.get str i <> String.get str j then false
    else is_palindrome_from (i + 1) (j - 1)
  in
  is_palindrome_from 0 (len - 1)

(* Test cases *)
let () =
  let test_palindrome str =
    print_string ("Testing \"" ^ str ^ "\": ");
    print_string (string_of_bool (ft_is_palindrome str));
    print_char '\n'
  in
  test_palindrome "radar";     (* Should print: true *)
  test_palindrome "madam";     (* Should print: true *)
  test_palindrome "car";       (* Should print: false *)
  test_palindrome "";          (* Should print: true *)
  test_palindrome "a";         (* Should print: true *)
  test_palindrome "level"      (* Should print: true *)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_is_palindrome.ml -o ft_is_palindrome                       *)
(* $ ./ft_is_palindrome                                                      *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ft_is_palindrome.ml";;                                            *)
(* # ft_is_palindrome "radar";;                                               *)
(* - : bool = true                                                             *)
(* # ft_is_palindrome "car";;                                                 *)
(* - : bool = false                                                            *)
(*                                                                            *)
(* ************************************************************************** *) 