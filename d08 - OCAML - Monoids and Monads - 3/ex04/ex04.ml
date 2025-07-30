module Set = struct
  type 'a t = 'a list  (* Simple list-based implementation *)
  
  let return x = [x]
  
  let bind s f =
    List.flatten (List.map f s)
  
  let union s1 s2 =
    let rec remove_duplicates = function
      | [] -> []
      | x :: xs -> x :: remove_duplicates (List.filter (fun y -> y <> x) xs)
    in
    remove_duplicates (s1 @ s2)
  
  let inter s1 s2 =
    List.filter (fun x -> List.mem x s2) s1
  
  let diff s1 s2 =
    List.filter (fun x -> not (List.mem x s2)) s1
  
  let filter s pred =
    List.filter pred s
  
  let foreach s f =
    List.iter f s
  
  let for_all s pred =
    List.for_all pred s
  
  let exists s pred =
    List.exists pred s
end

(* Test block *)
let () =
  let open Set in
  let s1 = return 1 in
  let s2 = return 2 in
  let s3 = union s1 s2 in
  let s4 = union s3 (return 3) in
  
  Printf.printf "Set 1: ";
  foreach s1 (fun x -> Printf.printf "%d " x);
  print_endline "";
  
  Printf.printf "Set 2: ";
  foreach s2 (fun x -> Printf.printf "%d " x);
  print_endline "";
  
  Printf.printf "Union: ";
  foreach s3 (fun x -> Printf.printf "%d " x);
  print_endline "";
  
  Printf.printf "Union with 3: ";
  foreach s4 (fun x -> Printf.printf "%d " x);
  print_endline "";
  
  let doubled = bind s4 (fun x -> return (x * 2)) in
  Printf.printf "Doubled: ";
  foreach doubled (fun x -> Printf.printf "%d " x);
  print_endline "";
  
  let filtered = filter s4 (fun x -> x > 1) in
  Printf.printf "Filtered (>1): ";
  foreach filtered (fun x -> Printf.printf "%d " x);
  print_endline "";
  
  Printf.printf "All > 0: %b\n" (for_all s4 (fun x -> x > 0));
  Printf.printf "Exists > 2: %b\n" (exists s4 (fun x -> x > 2));
  
  let intersection = inter s4 (return 2) in
  Printf.printf "Intersection with {2}: ";
  foreach intersection (fun x -> Printf.printf "%d " x);
  print_endline "";
  
  let difference = diff s4 (return 2) in
  Printf.printf "Difference with {2}: ";
  foreach difference (fun x -> Printf.printf "%d " x);
  print_endline ""

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ex04.ml -o ex04                                                 *)
(* $ ./ex04                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ex04.ml";;                                                         *)
(* # open Set;;                                                                *)
(* # let s1 = return 1;;                                                       *)
(* val s1 : int Set.t = [1]                                                   *)
(* # let s2 = return 2;;                                                       *)
(* val s2 : int Set.t = [2]                                                   *)
(* # union s1 s2;;                                                              *)
(* - : int Set.t = [1; 2]                                                     *)
(*                                                                            *)
(* ************************************************************************** *) 