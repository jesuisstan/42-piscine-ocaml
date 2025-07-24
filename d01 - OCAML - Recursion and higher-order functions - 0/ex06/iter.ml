(* ************************************************************************** *)
(*                                                                            *)
(* iter.ml                                                                    *)
(* Exercise 06: Function iteration                                            *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Applies function f to x, n times
   iter(f, x, n) = f(f(...f(x)...)) (n times)
   Returns -1 if n is negative *)

let iter f x n =
  if n < 0 then -1
  else
    let rec iter_aux x i =
      if i = 0 then x
      else iter_aux (f x) (i - 1)
    in
    iter_aux x n

(* Test cases *)
let () =
  let test_iter f x n expected =
    let result = iter f x n in
    print_string ("iter(f, " ^ string_of_int x ^ ", " ^ string_of_int n ^ ") = ");
    print_int result;
    print_string (" (Expected: " ^ string_of_int expected ^ ")");
    print_char '\n'
  in
  (* Test cases from subject *)
  test_iter (fun x -> x * x) 2 4 65536;  (* 2^(2^4) = 65536 *)
  test_iter (fun x -> x * 2) 2 4 32;     (* 2 * 2^4 = 32 *)
  
  (* Additional test cases *)
  test_iter (fun x -> x + 1) 0 5 5;      (* Increment 5 times *)
  test_iter (fun x -> x * 3) 1 3 27;     (* 1 * 3^3 = 27 *)
  test_iter (fun x -> x / 2) 32 3 4;     (* 32 / 2^3 = 4 *)
  test_iter (fun x -> x * 2) 1 0 1;      (* n = 0 case *)
  test_iter (fun x -> x + 1) 0 (-1) (-1) (* Negative n case *)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt iter.ml -o iter                                                *)
(* $ ./iter                                                                   *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "iter.ml";;                                                         *)
(* # iter (fun x -> x * 2) 1 3;;                                              *)
(* - : int = 8                                                                *)
(* # iter (fun x -> x + 1) 0 5;;                                              *)
(* - : int = 5                                                                *)
(*                                                                            *)
(* ************************************************************************** *) 