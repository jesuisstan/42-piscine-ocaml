(* ************************************************************************** *)
(*                                                                            *)
(* fibonacci.ml                                                               *)
(* Exercise 04: Tail-recursive Fibonacci                                      *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Single top-level let definition as required
   Tail-recursive implementation of Fibonacci sequence
   Returns -1 if n is negative *)

let fibonacci n =
  if n < 0 then -1
  else if n = 0 then 0
  else
    let rec fib_aux i prev curr =
      if i = n then curr
      else fib_aux (i + 1) curr (prev + curr)
    in
    fib_aux 1 0 1

let main () =
  print_endline "# Test cases from subject:";
  print_endline ("fibonacci(-42) = " ^ string_of_int (fibonacci (-42)));
  print_endline ("fibonacci(1) = " ^ string_of_int (fibonacci 1));
  print_endline ("fibonacci(3) = " ^ string_of_int (fibonacci 3));
  print_endline ("fibonacci(6) = " ^ string_of_int (fibonacci 6));
  print_endline "\n# Additional test cases:";
  print_endline ("fibonacci(0) = " ^ string_of_int (fibonacci 0));
  print_endline ("fibonacci(2) = " ^ string_of_int (fibonacci 2));
  print_endline ("fibonacci(5) = " ^ string_of_int (fibonacci 5));
  print_endline ("fibonacci(10) = " ^ string_of_int (fibonacci 10));
  print_endline ("fibonacci(-1) = " ^ string_of_int (fibonacci (-1)))

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt fibonacci.ml -o fibonacci                                      *)
(* $ ./fibonacci                                                             *)
(*                                                                            *)
(* ************************************************************************** *) 