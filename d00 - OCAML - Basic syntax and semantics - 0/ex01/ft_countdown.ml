(* ************************************************************************** *)
(*                                                                            *)
(* ft_countdown.ml                                                            *)
(* Exercise 01: Countdown from a given number to 0                            *)
(* Allowed functions: print_int, print_char                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Prints a countdown from n to 0.
   If n < 0, it just prints 0.
   Each number is printed on a new line. *)

let rec ft_countdown n =
  if n < 0 then
    (print_int 0; print_char '\n')
  else begin
    print_int n;
    print_char '\n';
    if n > 0 then ft_countdown (n - 1)
  end

(* Test cases *)
let () =
  ft_countdown 3;
  ft_countdown 0;
  ft_countdown (-1)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_countdown.ml -o ft_countdown                                 *)
(* $ ./ft_countdown                                                           *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ft_countdown.ml";;                                                 *)
(* # ft_countdown 3;;                                                         *)
(* 3                                                                          *)
(* 2                                                                          *)
(* 1                                                                          *)
(* 0                                                                          *)
(*                                                                            *)
(* ************************************************************************** *)
