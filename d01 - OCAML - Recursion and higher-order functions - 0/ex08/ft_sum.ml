(* ************************************************************************** *)
(*                                                                            *)
(* ft_sum.ml                                                                  *)
(* Exercise 08: Summation function                                            *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Computes the sum of f(i) for i from start to end (inclusive)
   Uses tail recursion for efficiency
   Returns nan if end < start *)

let ft_sum f start end_val =
  if end_val < start then nan
  else
    let rec sum_aux i acc =
      if i > end_val then acc
      else sum_aux (i + 1) (acc +. f i)
    in
    sum_aux start 0.

(* Test cases *)
let () =
  let test_sum f start end_val expected =
    let result = ft_sum f start end_val in
    print_string ("Sum from " ^ string_of_int start ^ " to " ^ string_of_int end_val ^ " = ");
    print_float result;
    print_string (" (Expected: " ^ string_of_float expected ^ ")");
    print_char '\n'
  in
  (* Test case from subject: sum of i^2 from 1 to 10 *)
  test_sum (fun i -> float_of_int (i * i)) 1 10 385.;
  
  (* Additional test cases *)
  test_sum float_of_int 1 5 15.;                    (* Sum of first 5 integers *)
  test_sum (fun _ -> 1.) 1 10 10.;                  (* Count from 1 to 10 *)
  test_sum (fun i -> float_of_int (i * 2)) 1 5 30.; (* Sum of first 5 even numbers *)
  test_sum float_of_int 5 1 nan                     (* Invalid range *)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_sum.ml -o ft_sum                                            *)
(* $ ./ft_sum                                                                 *)
(*                                                                            *)
(* ************************************************************************** *) 