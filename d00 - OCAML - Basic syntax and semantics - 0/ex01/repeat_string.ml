(* ************************************************************************** *)
(*                                                                            *)
(* repeat_string.ml                                                           *)
(* Exercise 01: Repeat string n times                                         *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Returns str repeated n times
   If str is not provided, behaves like repeat_x
   Returns "Error" if n is negative *)

let repeat_string ?(str="x") n =
  if n < 0 then "Error"
  else
    let rec build_string i acc =
      if i = 0 then acc
      else build_string (i - 1) (str ^ acc)
    in
    build_string n ""

let main () =
  print_endline "# Test cases from subject:";
  print_endline ("repeat_string(-1) = \"" ^ repeat_string (-1) ^ "\"");
  print_endline ("repeat_string(0) = \"" ^ repeat_string 0 ^ "\"");
  print_endline ("repeat_string ~str:\"Toto\" 1 = \"" ^ repeat_string ~str:"Toto" 1 ^ "\"");
  print_endline ("repeat_string(2) = \"" ^ repeat_string 2 ^ "\"");
  print_endline ("repeat_string ~str:\"a\" 5 = \"" ^ repeat_string ~str:"a" 5 ^ "\"");
  print_endline ("repeat_string ~str:\"what\" 3 = \"" ^ repeat_string ~str:"what" 3 ^ "\"");
  print_endline "\n# Additional test cases:";
  print_endline ("repeat_string ~str:\"\" 5 = \"" ^ repeat_string ~str:"" 5 ^ "\"");
  print_endline ("repeat_string ~str:\" \" 3 = \"" ^ repeat_string ~str:" " 3 ^ "\"")

let () = main () 