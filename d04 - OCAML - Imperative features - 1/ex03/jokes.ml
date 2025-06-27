let read_jokes filename =
  let lines = ref [] in
  let ic = open_in filename in
  try
    while true do
      lines := input_line ic :: !lines
    done; [||]
  with End_of_file ->
    close_in ic;
    Array.of_list (List.rev !lines)

let () =
  if Array.length Sys.argv <> 2 then (print_endline "Usage: jokes <file>"; exit 1);
  let jokes = read_jokes Sys.argv.(1) in
  if Array.length jokes = 0 then (print_endline "No jokes found!"; exit 1);
  Random.self_init ();
  let idx = Random.int (Array.length jokes) in
  print_endline jokes.(idx)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -I +unix -o jokes unix.cmxa jokes.ml                             *)
(* $ ./jokes jokes.txt                                                        *)
(*                                                                            *)
(* ************************************************************************** *) 