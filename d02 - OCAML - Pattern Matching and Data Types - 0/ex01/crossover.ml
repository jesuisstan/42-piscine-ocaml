(* ************************************************************************** *)
(*                                                                            *)
(* crossover.ml                                                               *)
(* Exercise 01: Find common elements between two lists                        *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Returns a list of all common elements between two lists
   Empty list if either input list is empty *)

let crossover l1 l2 =
  let rec contains x = function
    | [] -> false
    | h :: t -> h = x || contains x t
  in
  let rec unique_common acc = function
    | [] -> acc
    | h :: t -> 
        if contains h l2 && not (contains h acc)
        then unique_common (h :: acc) t
        else unique_common acc t
  in
  unique_common [] l1

let main () =
  let print_list to_string l =
    print_string "[";
    List.iteri (fun i x ->
      if i > 0 then print_string "; ";
      print_string (to_string x)) l;
    print_endline "]"
  in
  let print_int_list = print_list string_of_int in
  let print_char_list l =
    print_list (fun c -> "'" ^ String.make 1 c ^ "'") l
  in
  print_endline "# Test cases:";
  print_string "crossover [] [1; 2; 3] = ";
  print_int_list (crossover [] [1; 2; 3]);
  print_string "crossover [1; 2; 3] [] = ";
  print_int_list (crossover [1; 2; 3] []);
  print_string "crossover [1; 2; 3; 4] [2; 4; 6] = ";
  print_int_list (crossover [1; 2; 3; 4] [2; 4; 6]);
  print_string "crossover ['a'; 'b'; 'c'] ['b'; 'd'; 'c'] = ";
  print_char_list (crossover ['a'; 'b'; 'c'] ['b'; 'd'; 'c'])

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt crossover.ml -o crossover                                      *)
(* $ ./crossover                                                              *)
(*                                                                            *)
(* ************************************************************************** *) 