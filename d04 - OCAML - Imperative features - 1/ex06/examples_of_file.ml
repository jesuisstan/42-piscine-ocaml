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

let print_example_ocaml_tuple_with_header idx (arr, label) =
  Printf.printf "EXAMPLE %d ------> \n" (idx + 1);
  Printf.printf "([|";
  Array.iteri (fun i x ->
    if i > 0 then Printf.printf "; ";
    Printf.printf "%g" x
  ) arr;
  Printf.printf "|], \"%s\")\n" label

let () =
  let usage () =
    print_endline "Usage: ./examples_of_file <csv_file> [count]";
    exit 1
  in
  let argc = Array.length Sys.argv in
  if argc < 2 then usage ();
  let file = Sys.argv.(1) in
  let examples = examples_of_file file in
  let total = List.length examples in
  Printf.printf "Read %d examples from %s\n" total file;
  if argc = 2 then (
    List.iteri print_example_ocaml_tuple_with_header examples
  ) else (
    let count =
      try int_of_string Sys.argv.(2)
      with Failure _ ->
        Printf.printf "Invalid count argument, printing only the first example.\n";
        0
    in
    if count < 1 || count > total then (
      Printf.printf "Invalid count argument, printing only the first example.\n";
      match examples with
      | ex :: _ -> print_example_ocaml_tuple_with_header 0 ex
      | [] -> Printf.printf "No examples found\n"
    ) else (
      List.iteri (fun i ex -> if i < count then print_example_ocaml_tuple_with_header i ex) examples
    )
  )

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o examples_of_file examples_of_file.ml                         *)
(* $ ./examples_of_file ./attachment/ionosphere.train.csv                     *)
(*                                                                            *)
(* ************************************************************************** *)