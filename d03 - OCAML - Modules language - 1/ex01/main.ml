(* ************************************************************************** *)
(*                                                                            *)
(* main.ml                                                                    *)
(* Exercise 01: Cards values                                                  *)
(* Tests for Value module                                                    *)
(*                                                                            *)
(* ************************************************************************** *)

let print_value_info value =
  Printf.printf "Value: %-6s (short: %-2s) (int: %2d)\n"
    (Value.toStringVerbose value) (Value.toString value) (Value.toInt value)

let test_next value =
  try
    let next = Value.next value in
    Printf.printf "next(%s) = %s\n" 
      (Value.toStringVerbose value) (Value.toStringVerbose next)
  with Invalid_argument msg -> Printf.printf "next(%s) -> %s\n" 
    (Value.toStringVerbose value) msg

let test_previous value =
  try
    let prev = Value.previous value in
    Printf.printf "previous(%s) = %s\n" 
      (Value.toStringVerbose value) (Value.toStringVerbose prev)
  with Invalid_argument msg -> Printf.printf "previous(%s) -> %s\n" 
    (Value.toStringVerbose value) msg

let main () =
  print_endline "# Testing Value module:";
  
  print_endline "\n# Testing all values:";
  List.iter print_value_info Value.all;
  
  print_endline "\n# Testing next function:";
  test_next Value.T2;
  test_next Value.T10;
  test_next Value.Jack;
  test_next Value.As;
  
  print_endline "\n# Testing previous function:";
  test_previous Value.T2;
  test_previous Value.T10;
  test_previous Value.Jack;
  test_previous Value.As

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt Value.ml main.ml -o value                                      *)
(* $ ./value                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "Value.ml";;                                                        *)
(* # Value.toString Value.T2;;                                                 *)
(* - : string = "2"                                                          *)
(* # Value.toStringVerbose Value.Jack;;                                        *)
(* - : string = "Jack"                                                       *)
(*                                                                            *)
(* ************************************************************************** *) 