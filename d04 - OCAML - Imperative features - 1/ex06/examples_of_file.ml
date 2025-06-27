let split_on_comma s =
  let rec aux acc i j =
    if j = String.length s then List.rev ((String.sub s i (j - i)) :: acc)
    else if s.[j] = ',' then aux ((String.sub s i (j - i)) :: acc) (j + 1) (j + 1)
    else aux acc i (j + 1)
  in
  aux [] 0 0

let parse_line line =
  let parts = split_on_comma line in
  let floats = List.rev (List.tl (List.rev parts)) in
  let arr = Array.of_list (List.map float_of_string floats) in
  let label = List.hd (List.rev parts) in
  (arr, label)

let examples_of_file filename =
  let ic = open_in filename in
  let rec loop acc =
    try
      let line = input_line ic in
      if String.trim line = "" then loop acc
      else loop (parse_line line :: acc)
    with End_of_file ->
      close_in ic;
      List.rev acc
  in
  loop []

(* Test with provided CSV file *)
let () =
  let file = "../attachment/ionosphere.train.csv" in
  let examples = examples_of_file file in
  Printf.printf "Read %d examples from %s\n" (List.length examples) file;
  match examples with
  | (arr, label) :: _ ->
      Printf.printf "First example: label=%s, features=[|" label;
      Array.iter (Printf.printf "%f;") arr;
      Printf.printf "|]\n"
  | [] -> Printf.printf "No examples found\n"

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o examples_of_file examples_of_file.ml                         *)
(* $ ./examples_of_file ../attachment/ionosphere.train.csv                    *)
(*                                                                            *)
(* ************************************************************************** *) 