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
  let print_tuple (count, value) =
    print_string ("(" ^ string_of_int count ^ ", ");
    (match value with
     | c when (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') ->
         print_string ("'" ^ String.make 1 c ^ "'")
     | _ -> print_string (string_of_int value));
    print_string ")"
  in
  let print_list l =
    print_string "[";
    List.iteri (fun i x ->
      if i > 0 then print_string "; ";
      print_tuple x) l;
    print_endline "]"
  in
  print_endline "# Test cases:";
  print_string "encode [] = ";
  print_list (encode []);
  print_string "encode ['a'; 'a'; 'a'; 'b'; 'b'] = ";
  print_list (encode ['a'; 'a'; 'a'; 'b'; 'b']);
  print_string "encode [1; 1; 1; 2; 2; 3] = ";
  print_list (encode [1; 1; 1; 2; 2; 3]);
  print_string "encode ['x'] = ";
  print_list (encode ['x'])

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt encode.ml -o encode                                            *)
(* $ ./encode                                                                 *)
(*                                                                            *)
(* ************************************************************************** *) 