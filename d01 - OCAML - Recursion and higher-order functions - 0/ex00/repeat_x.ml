(* ************************************************************************** *)
(*                                                                            *)
(* repeat_x.ml                                                                *)
(* Exercise 00: Repeat character 'x'                                          *)
(* Allowed functions: None                                                    *)
(*                                                                            *)
(* ************************************************************************** *)

(* Returns a string containing 'x' repeated n times
   Returns "Error" if n is negative *)

let repeat_x n =
  if n < 0 then "Error"
  else
    let rec build_string i acc =
      if i = 0 then acc
      else build_string (i - 1) ("x" ^ acc)
    in
    build_string n ""

(* Test cases *)
let () =
  let test_repeat_x n =
    print_string ("repeat_x(" ^ string_of_int n ^ ") = \"");
    print_string (repeat_x n);
    print_string "\"\n"
  in
  (* Test cases from subject *)
  test_repeat_x (-1);  (* Should print: Error *)
  test_repeat_x 0;     (* Should print: "" *)
  test_repeat_x 1;     (* Should print: x *)
  test_repeat_x 2;     (* Should print: xx *)
  test_repeat_x 5      (* Should print: xxxxx *)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt repeat_x.ml -o repeat_x                                         *)
(* $ ./repeat_x                                                               *)
(*                                                                            *)
(* ************************************************************************** *) 