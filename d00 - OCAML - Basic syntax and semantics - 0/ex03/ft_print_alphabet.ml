(* ************************************************************************** *)
(*                                                                            *)
(* ft_print_alphabet.ml                                                      *)
(* Exercise 03: Print Alphabet                                               *)
(* Allowed functions: char_of_int, int_of_char and print_char               *)
(*                                                                            *)
(* ************************************************************************** *)

(* Prints the alphabet from a to z on a single line.
   Uses recursion and ASCII values instead of hardcoding letters.
   Only uses print_char once for letters (plus once for newline). *)

let ft_print_alphabet () =
  let rec print_from_ascii current_ascii =
    let current_char = char_of_int current_ascii in
    print_char current_char;
    if current_ascii < (int_of_char 'z') then
      print_from_ascii (current_ascii + 1)
  in
  print_from_ascii (int_of_char 'a');
  print_char '\n'

(* Test case *)
let () =
  ft_print_alphabet ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_print_alphabet.ml -o ft_print_alphabet                      *)
(* $ ./ft_print_alphabet                                                     *)
(*                                                                            *)
(* ************************************************************************** *) 