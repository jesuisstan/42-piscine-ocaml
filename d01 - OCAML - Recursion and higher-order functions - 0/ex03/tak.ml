(* ************************************************************************** *)
(*                                                                            *)
(* tak.ml                                                                     *)
(* Exercise 03: Takeuchi function                                             *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Implements the Takeuchi function:
   tak(x,y,z) = tak(tak(x-1,y,z), tak(y-1,z,x), tak(z-1,x,y))  if y < x
   tak(x,y,z) = z                                               otherwise *)

let rec tak x y z =
  if y >= x then z
  else tak (tak (x - 1) y z)
          (tak (y - 1) z x)
          (tak (z - 1) x y)

let main () =
  print_endline "# Test cases from subject:";
  print_endline ("tak 1 2 3 = " ^ string_of_int (tak 1 2 3));
  print_endline ("tak 5 23 7 = " ^ string_of_int (tak 5 23 7));
  print_endline ("tak 9 1 0 = " ^ string_of_int (tak 9 1 0));
  print_endline ("tak 1 1 1 = " ^ string_of_int (tak 1 1 1));
  print_endline ("tak 0 42 0 = " ^ string_of_int (tak 0 42 0));
  print_endline ("tak 23498 98734 98776 = " ^ string_of_int (tak 23498 98734 98776));
  print_endline "\n# Additional test cases:";
  print_endline ("tak 2 2 2 = " ^ string_of_int (tak 2 2 2));
  print_endline ("tak 4 3 2 = " ^ string_of_int (tak 4 3 2));
  print_endline ("tak 0 0 0 = " ^ string_of_int (tak 0 0 0))

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt tak.ml -o tak                                                  *)
(* $ ./tak                                                                    *)
(*                                                                            *)
(* ************************************************************************** *) 