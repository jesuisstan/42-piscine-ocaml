(* ************************************************************************** *)
(*                                                                            *)
(* ft_print_rev.ml                                                           *)
(* Exercise 05: Print string in reverse                                      *)
(* Allowed functions: print_char, String.get and String.length              *)
(*                                                                            *)
(* ************************************************************************** *)

(* Prints a string in reverse order, followed by a newline.
   Uses recursion to print characters from last to first. *)

let ft_print_rev str =
  let len = String.length str in
  let rec print_rev_from i =
    if i >= 0 then begin
      print_char (String.get str i);
      print_rev_from (i - 1)
    end
  in
  print_rev_from (len - 1);
  print_char '\n'

(* Test cases *)
let () =
  ft_print_rev "Hello world !";  (* Should print: ! dlrow olleH *)
  ft_print_rev "";               (* Should print just a newline *)
  ft_print_rev "OCaml"          (* Should print: lmaCO *)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_print_rev.ml -o ft_print_rev                               *)
(* $ ./ft_print_rev                                                          *)
(*                                                                            *)
(* ************************************************************************** *) 