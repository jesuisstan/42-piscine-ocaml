(* ************************************************************************** *)
(*                                                                            *)
(* repeat_x.ml for Piscine OCaml d00                                         *)
(* Made by                                                                    *)
(* Login   <>                                                                *)
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

let main () =
  print_endline "# Test cases from subject:";
  print_endline ("repeat_x(-1) = \"" ^ repeat_x (-1) ^ "\"");
  print_endline ("repeat_x(0) = \"" ^ repeat_x 0 ^ "\"");
  print_endline ("repeat_x(1) = \"" ^ repeat_x 1 ^ "\"");
  print_endline ("repeat_x(2) = \"" ^ repeat_x 2 ^ "\"");
  print_endline ("repeat_x(5) = \"" ^ repeat_x 5 ^ "\"");
  print_endline "\n# Additional test cases:";
  print_endline ("repeat_x(10) = \"" ^ repeat_x 10 ^ "\"");
  print_endline ("repeat_x(-42) = \"" ^ repeat_x (-42) ^ "\"")

let () = main () 