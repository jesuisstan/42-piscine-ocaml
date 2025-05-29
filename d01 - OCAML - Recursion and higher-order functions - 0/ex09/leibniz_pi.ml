(* ************************************************************************** *)
(*                                                                            *)
(* leibniz_pi.ml                                                             *)
(* Exercise 09: Leibniz's formula for pi                                     *)
(* Allowed functions: atan, float_of_int                                    *)
(*                                                                            *)
(* ************************************************************************** *)

(* Computes pi using Leibniz's formula:
   π = 4 * sum((-1)^i / (2i + 1)) for i from 0 to infinity
   Returns number of iterations needed to reach given delta
   Uses tail recursion for efficiency *)

let leibniz_pi delta =
  if delta < 0. then -1
  else
    let pi = 4. *. (atan 1.) in
    let rec compute_pi_aux i acc =
      let term = 4. *. (if i mod 2 = 0 then 1. else -1.) /. float_of_int (2 * i + 1) in
      let new_acc = acc +. term in
      if abs_float (pi -. new_acc) <= delta then i + 1
      else compute_pi_aux (i + 1) new_acc
    in
    compute_pi_aux 0 0.

let main () =
  print_endline "# Test cases with various deltas:";
  print_endline ("leibniz_pi(-1.0) = " ^ string_of_int (leibniz_pi (-1.)));
  print_endline ("leibniz_pi(1.0) = " ^ string_of_int (leibniz_pi 1.));
  print_endline ("leibniz_pi(0.1) = " ^ string_of_int (leibniz_pi 0.1));
  print_endline ("leibniz_pi(0.01) = " ^ string_of_int (leibniz_pi 0.01));
  print_endline "\n# Additional test cases:";
  print_endline ("leibniz_pi(0.5) = " ^ string_of_int (leibniz_pi 0.5));
  print_endline ("leibniz_pi(0.05) = " ^ string_of_int (leibniz_pi 0.05));
  print_endline ("leibniz_pi(0.001) = " ^ string_of_int (leibniz_pi 0.001))

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt leibniz_pi.ml -o leibniz_pi                                    *)
(* $ ./leibniz_pi                                                            *)
(*                                                                            *)
(* ************************************************************************** *) 