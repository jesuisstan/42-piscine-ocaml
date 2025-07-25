(* ************************************************************************** *)
(*                                                                            *)
(* ackermann.ml                                                               *)
(* Exercise 02: Ackermann function                                            *)
(* Allowed functions: None                                                    *)
(*                                                                            *)
(* ************************************************************************** *)

(* Implements the Ackermann function:
   A(m,n) = n + 1                    if m = 0
   A(m,n) = A(m-1,1)                if m > 0 and n = 0
   A(m,n) = A(m-1,A(m,n-1))         if m > 0 and n > 0
   Returns -1 if any argument is negative *)
(*                                                                            *)
(* EXPLANATION: Function that demonstrates exponential growth through         *)
(* double recursion. Values grow extremely fast: A(4,1) = 65533.            *)
(*                                                                            *)

let rec ackermann m n =
  if m < 0 || n < 0 then -1
  else if m = 0 then n + 1
  else if n = 0 then ackermann (m - 1) 1
  else ackermann (m - 1) (ackermann m (n - 1))

let main () =
  print_endline "# Test cases from subject:";
  print_endline ("ackermann(-1) 7 = " ^ string_of_int (ackermann (-1) 7));
  print_endline ("ackermann 0 0 = " ^ string_of_int (ackermann 0 0));
  print_endline ("ackermann 2 3 = " ^ string_of_int (ackermann 2 3));
  print_endline ("ackermann 4 1 = " ^ string_of_int (ackermann 4 1));
  print_endline "\n# Additional test cases:";
  print_endline ("ackermann 0 1 = " ^ string_of_int (ackermann 0 1));
  print_endline ("ackermann 1 1 = " ^ string_of_int (ackermann 1 1));
  print_endline ("ackermann 1 2 = " ^ string_of_int (ackermann 1 2));
  print_endline ("ackermann 2 2 = " ^ string_of_int (ackermann 2 2));
  print_endline ("ackermann 3 2 = " ^ string_of_int (ackermann 3 2))

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ackermann.ml -o ackermann                                       *)
(* $ ./ackermann                                                              *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ackermann.ml";;                                                    *)
(* # ackermann 0 0;;                                                           *)
(* - : int = 1                                                                *)
(* # ackermann 2 3;;                                                           *)
(* - : int = 9                                                                *)
(*                                                                            *)
(* ************************************************************************** *) 