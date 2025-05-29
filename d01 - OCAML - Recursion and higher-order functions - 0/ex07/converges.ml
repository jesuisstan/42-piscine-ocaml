(* ************************************************************************** *)
(*                                                                            *)
(* converges.ml                                                               *)
(* Exercise 07: Fixed point convergence                                       *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Checks if function f reaches a fixed point when applied n times to x
   A fixed point is a value where f(x) = x
   Returns false if n <= 0 *)

let converges f x n =
  let rec check_convergence prev_x i =
    if i <= 0 then false
    else
      let next_x = f prev_x in
      if next_x = prev_x then true
      else check_convergence next_x (i - 1)
  in
  if n <= 0 then false
  else check_convergence x n

(* Test cases *)
let () =
  let test_converges f x n expected =
    let result = converges f x n in
    print_string ("converges(f, " ^ string_of_int x ^ ", " ^ string_of_int n ^ ") = ");
    print_string (string_of_bool result);
    print_string (" (Expected: " ^ string_of_bool expected ^ ")");
    print_char '\n'
  in
  (* Test cases from subject *)
  test_converges (( * ) 2) 2 5 false;      (* Doubles each time, never converges *)
  test_converges (fun x -> x / 2) 2 3 true; (* Converges to 0 *)
  test_converges (fun x -> x / 2) 2 2 true; (* Converges to 0 *)
  
  (* Additional test cases *)
  test_converges (fun x -> x) 42 1 true;    (* Identity function always converges *)
  test_converges (fun x -> 1) 5 2 true;     (* Constant function converges immediately *)
  test_converges (fun x -> x + 1) 0 5 false (* Never converges *)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt converges.ml -o converges                                      *)
(* $ ./converges                                                             *)
(*                                                                            *)
(* ************************************************************************** *) 