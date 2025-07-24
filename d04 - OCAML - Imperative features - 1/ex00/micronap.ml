let my_sleep () = Unix.sleep 1

let () =
  if Array.length Sys.argv <> 2 then exit 0;
  try
    let n = int_of_string Sys.argv.(1) in
    if n < 0 then exit 0;
    for _ = 1 to n do my_sleep () done
  with _ -> exit 0

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -I +unix -o micronap unix.cmxa micronap.ml                      *)
(* $ ./micronap 3                                                             *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "micronap.ml";;                                                     *)
(* # my_sleep ();;                                                             *)
(* (* Function will sleep for 1 second *)                                      *)
(*                                                                            *)
(* ************************************************************************** *) 