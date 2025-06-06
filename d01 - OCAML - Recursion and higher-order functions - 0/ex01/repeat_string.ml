(* ************************************************************************** *)
(*                                                                            *)
(* repeat_string.ml                                                           *)
(* Exercise 01: Repeat string n times                                         *)
(* Allowed functions: None                                                    *)
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

(* Test cases *)
let () =
  let test_repeat_string ?str n =
    print_string "repeat_string";
    (match str with
     | Some s -> print_string ("~str:\"" ^ s ^ "\" ")
     | None -> print_string " ");
    print_string (string_of_int n);
    print_string " = \"";
    print_string (match str with
                 | Some s -> repeat_string ~str:s n
                 | None -> repeat_string n);
    print_string "\"\n"
  in
  (* Test cases from subject *)
  test_repeat_string (-1);                (* Should print: Error *)
  test_repeat_string 0;                   (* Should print: "" *)
  test_repeat_string ~str:"Toto" 1;       (* Should print: Toto *)
  test_repeat_string 2;                   (* Should print: xx *)
  test_repeat_string ~str:"a" 5;          (* Should print: aaaaa *)
  test_repeat_string ~str:"what" 3        (* Should print: whatwhatwhat *)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt repeat_string.ml -o repeat_string                               *)
(* $ ./repeat_string                                                          *)
(*                                                                            *)
(* ************************************************************************** *) 