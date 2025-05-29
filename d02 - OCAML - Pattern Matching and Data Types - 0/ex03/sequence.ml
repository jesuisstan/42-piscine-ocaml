(* ************************************************************************** *)
(*                                                                            *)
(* sequence.ml                                                                *)
(* Exercise 03: Look-and-say sequence                                         *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Generates the nth element of the look-and-say sequence
   Returns empty string for invalid input *)

let sequence n =
  let count_and_say s =
    let rec aux count curr acc = function
      | [] -> string_of_int count ^ String.make 1 curr ^ acc
      | h :: t when h = curr -> aux (count + 1) curr acc t
      | h :: t -> aux 1 h (string_of_int count ^ String.make 1 curr ^ acc) t
    in
    match String.length s with
    | 0 -> ""
    | _ -> 
        let first = s.[0] in
        let chars = List.init (String.length s) (String.get s) in
        String.concat "" [aux 1 first "" (List.tl chars)]
  in
  let rec generate_sequence i curr =
    if i <= 0 then ""
    else if i = 1 then "1"
    else generate_sequence (i - 1) curr |> count_and_say
  in
  if n <= 0 then ""
  else generate_sequence n "1"

let main () =
  print_endline "# Test cases:";
  print_endline ("sequence 0 = \"" ^ sequence 0 ^ "\"");
  print_endline ("sequence 1 = \"" ^ sequence 1 ^ "\"");
  print_endline ("sequence 2 = \"" ^ sequence 2 ^ "\"");
  print_endline ("sequence 3 = \"" ^ sequence 3 ^ "\"");
  print_endline ("sequence 4 = \"" ^ sequence 4 ^ "\"");
  print_endline ("sequence 5 = \"" ^ sequence 5 ^ "\"");
  print_endline ("sequence 6 = \"" ^ sequence 6 ^ "\"")

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt sequence.ml -o sequence                                        *)
(* $ ./sequence                                                               *)
(*                                                                            *)
(* ************************************************************************** *) 