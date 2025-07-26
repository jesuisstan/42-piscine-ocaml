(* ************************************************************************** *)
(*                                                                            *)
(* encode.ml                                                                  *)
(* Exercise 00: Run-length encoding                                           *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Encodes a list using run-length encoding
   Returns a list of tuples (count, element)
   Empty list returns empty list *)

let encode lst =
  let rec encode_aux count acc = function
    | [] -> acc
    | [x] -> (count + 1, x) :: acc
    | x :: (y :: _ as t) ->
        if x = y then encode_aux (count + 1) acc t
        else encode_aux 0 ((count + 1, x) :: acc) t
  in
  List.rev (encode_aux 0 [] lst)

let main () =
  let print_char_tuple (count, value) =
    print_string ("(" ^ string_of_int count ^ ", '" ^ String.make 1 value ^ "')")
  in
  let print_int_tuple (count, value) =
    print_string ("(" ^ string_of_int count ^ ", " ^ string_of_int value ^ ")")
  in
  let print_char_list l =
    print_string "[";
    List.iteri (fun i x ->
      if i > 0 then print_string "; ";
      print_char_tuple x) l;
    print_endline "]"
  in
  let print_int_list l =
    print_string "[";
    List.iteri (fun i x ->
      if i > 0 then print_string "; ";
      print_int_tuple x) l;
    print_endline "]"
  in
  print_endline "# Test cases:";
  print_string "encode ['a'; 'a'; 'a'; 'b'; 'b'; 'b'] = ";
  print_char_list (encode ['a'; 'a'; 'a'; 'b'; 'b'; 'b']);
  print_string "encode [] = ";
  print_char_list (encode []);
  print_string "encode [(3, 2); (3, 2); (4, 3)] = ";
  print_int_list (encode [(3, 2); (3, 2); (4, 3)])

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt encode.ml -o encode                                            *)
(* $ ./encode                                                                 *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "encode.ml";;                                                       *)
(* # encode ['a'; 'a'; 'a'; 'b'; 'b'];;                                       *)
(* - : (int * char) list = [(3, 'a'); (2, 'b')]                               *)
(* # encode [1; 1; 1; 2; 2; 3];;                                              *)
(* - : (int * int) list = [(3, 1); (2, 2); (1, 3)]                            *)
(*                                                                            *)
(* ************************************************************************** *) 