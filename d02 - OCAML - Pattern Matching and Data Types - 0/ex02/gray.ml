(* ************************************************************************** *)
(*                                                                            *)
(* gray.ml                                                                    *)
(* Exercise 02: Gray code sequence generation                                 *)
(* Allowed functions: String module                                           *)
(*                                                                            *)
(* ************************************************************************** *)

(* Generates Gray code sequence of size n
   Prints each code separated by space, followed by newline *)

let gray n =
  let rec generate_gray n =
    if n <= 0 then [""]
    else if n = 1 then ["0"; "1"]
    else
      let prev = generate_gray (n - 1) in
      let zeros = List.map (fun s -> "0" ^ s) prev in
      let ones = List.map (fun s -> "1" ^ s) (List.rev prev) in
      List.rev_append (List.rev zeros) ones
  in
  if n <= 0 then print_endline ""
  else
    let codes = generate_gray n in
    print_string (String.concat " " codes);
    print_endline ""

let main () =
  print_endline "# Test cases:";
  print_string "gray 0:\n";
  gray 0;
  print_string "gray 1:\n";
  gray 1;
  print_string "gray 2:\n";
  gray 2;
  print_string "gray 3:\n";
  gray 3;
  print_string "gray 4:\n";
  gray 4;
  print_string "gray 5:\n";
  gray 5

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt gray.ml -o gray                                                *)
(* $ ./gray                                                                   *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "gray.ml";;                                                         *)
(* # gray 1;;                                                                  *)
(* 0 1                                                                         *)
(* # gray 2;;                                                                  *)
(* 00 01 11 10                                                                 *)
(*                                                                            *)
(* ************************************************************************** *) 