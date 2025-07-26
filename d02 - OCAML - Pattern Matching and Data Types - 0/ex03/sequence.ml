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
      | [] -> acc ^ string_of_int count ^ String.make 1 curr
      | h :: t when h = curr -> aux (count + 1) curr acc t
      | h :: t -> aux 1 h (acc ^ string_of_int count ^ String.make 1 curr) t
    in
    match String.length s with
    | 0 -> ""
    | _ -> 
        let first = s.[0] in
        let chars = List.init (String.length s) (String.get s) in
        aux 1 first "" (List.tl chars)
  in
  let rec generate_sequence i =
    if i <= 0 then ""
    else if i = 1 then "1"
    else count_and_say (generate_sequence (i - 1))
  in
  generate_sequence n

let main () =
  print_endline "# Test cases:";
  print_endline ("sequence 1 = \"" ^ sequence 1 ^ "\"");
  print_endline ("sequence -1 = \"" ^ sequence (-1) ^ "\"");
  print_endline ("sequence 6 = \"" ^ sequence 6 ^ "\"");
  print_endline ("sequence 8 = \"" ^ sequence 8 ^ "\"")

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt sequence.ml -o sequence                                        *)
(* $ ./sequence                                                               *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "sequence.ml";;                                                     *)
(* # sequence 3;;                                                              *)
(* - : string = "21"                                                         *)
(* # sequence 4;;                                                              *)
(* - : string = "1211"                                                       *)
(*                                                                            *)
(* ************************************************************************** *) 