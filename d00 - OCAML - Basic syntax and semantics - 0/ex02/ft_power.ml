(* ************************************************************************** *)
(*                                                                            *)
(* ft_power.ml                                                               *)
(* Exercise 02: Power function                                               *)
(* Allowed functions: Nothing                                                *)
(*                                                                            *)
(* ************************************************************************** *)

(* Computes base raised to the power of exponent.
   Both parameters are non-negative integers.
   They will never both be 0 at the same time. *)

let rec ft_power base exponent =
  if exponent = 0 then 1
  else if base = 0 then 0
  else base * ft_power base (exponent - 1)

(* Test cases *)
let () =
  (* Test case from subject *)
  print_int (ft_power 2 4);    (* Should print 16 *)
  print_char '\n';
  
  print_int (ft_power 3 0);    (* Should print 1 *)
  print_char '\n';
  
  print_int (ft_power 0 5);    (* Should print 0 *)
  print_char '\n';
  
  (* Additional test cases *)
  print_int (ft_power 5 2);    (* Should print 25 *)
  print_char '\n';
  
  print_int (ft_power 1 10);   (* Should print 1 *)
  print_char '\n'

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_power.ml -o ft_power                                        *)
(* $ ./ft_power                                                              *)
(*                                                                            *)
(* ************************************************************************** *) 