let split_on_comma : string -> string list = fun input_string ->
  let rec helper result_list start_pos current_pos =
    if current_pos = String.length input_string then 
      List.rev ((String.sub input_string start_pos (current_pos - start_pos)) :: result_list)
    else if input_string.[current_pos] = ',' then 
      helper ((String.sub input_string start_pos (current_pos - start_pos)) :: result_list) (current_pos + 1) (current_pos + 1)
    else 
      helper result_list start_pos (current_pos + 1)
  in
  helper [] 0 0

let parse_line : string -> float array * string = fun csv_line ->
  let string_parts = split_on_comma csv_line in
  let number_strings = List.rev (List.tl (List.rev string_parts)) in
  let number_array = Array.of_list (List.map float_of_string number_strings) in
  let class_label = List.hd (List.rev string_parts) in
  (number_array, class_label)

let examples_of_file : string -> (float array * string) list = fun filename ->
  let input_file = open_in filename in
  let rec read_all_examples accumulated_examples =
    try
      let current_line = input_line input_file in
      if String.trim current_line = "" then 
        read_all_examples accumulated_examples
      else 
        read_all_examples (parse_line current_line :: accumulated_examples)
    with End_of_file ->
      close_in input_file;
      List.rev accumulated_examples
  in
  read_all_examples []

let print_example_ocaml_tuple_with_header : int -> (float array * string) -> unit = fun example_index (number_array, class_label) ->
  Printf.printf "EXAMPLE %d ------> \n" (example_index + 1);
  Printf.printf "([|";
  Array.iteri (fun position value ->
    if position > 0 then Printf.printf "; ";
    Printf.printf "%g" value
  ) number_array;
  Printf.printf "|], \"%s\")\n" class_label

let () =
  let usage : unit -> unit = fun () ->
    print_endline "Usage: ./examples_of_file <csv_file> [count]";
    exit 1
  in
  let argc = Array.length Sys.argv in
  if argc < 2 then usage ();
  let filename = Sys.argv.(1) in
  let examples = examples_of_file filename in
  let total = List.length examples in
  Printf.printf "Read %d examples from %s\n" total filename;
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
(* $ ./examples_of_file ionosphere.train.csv                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                    *)
(* # #use "examples_of_file.ml";;                                             *)
(* # let examples = examples_of_file "ionosphere.train.csv";;                 *)
(* val examples : (float array * string) list = [([|1.; 0.; ...|], "g"); ...] *)
(* # List.length examples;;                                                   *)
(* - : int = 200                                                              *)
(*                                                                            *)
(* ************************************************************************** *)