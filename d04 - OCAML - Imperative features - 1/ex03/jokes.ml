let read_jokes : string -> string array = fun filename ->
  let lines = ref [] in
  let input_file = open_in filename in
  try
    while true do
      lines := input_line input_file :: !lines
    done; [||]
  with End_of_file ->
    close_in input_file;
    Array.of_list (List.rev !lines)

let () =
  if Array.length Sys.argv <> 2 then (print_endline "Usage: jokes <file>"; exit 1);
  try
    let jokes = read_jokes Sys.argv.(1) in
    if Array.length jokes = 0 then (print_endline "No jokes found!"; exit 1);
    Random.self_init ();
    let idx = Random.int (Array.length jokes) in
    print_endline jokes.(idx)
  with Sys_error msg ->
    Printf.printf "Error: %s\n" msg;
    print_endline "Make sure the file exists and is readable.";
    exit 1

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -I +unix -o jokes unix.cmxa jokes.ml                             *)
(* $ ./jokes jokes.txt                                                        *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "jokes.ml";;                                                        *)
(* # let jokes = read_jokes "jokes.txt";;                                     *)
(* val jokes : string array = [|"Why did the OCaml programmer..."; ...|]      *)
(* # Random.self_init ();;                                                     *)
(* # let idx = Random.int (Array.length jokes);;                               *)
(* val idx : int = 1                                                           *)
(*                                                                            *)
(* ************************************************************************** *) 