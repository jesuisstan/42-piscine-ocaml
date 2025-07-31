module Set = struct
  type 'a t = 'a list  (* Simple list-based implementation *)
  
  let return (element : 'a) : 'a t = [element]
  
  let bind (set : 'a t) (function_to_apply : 'a -> 'b t) : 'b t =
    List.flatten (List.map function_to_apply set)
  
  let union (set1 : 'a t) (set2 : 'a t) : 'a t =
    let rec remove_duplicates = function
      | [] -> []
      | element :: rest -> element :: remove_duplicates (List.filter (fun y -> y <> element) rest)
    in
    remove_duplicates (set1 @ set2)
  
  let inter (set1 : 'a t) (set2 : 'a t) : 'a t =
    List.filter (fun element -> List.mem element set2) set1
  
  let diff (set1 : 'a t) (set2 : 'a t) : 'a t =
    List.filter (fun element -> not (List.mem element set2)) set1
  
  let filter (set : 'a t) (predicate : 'a -> bool) : 'a t =
    List.filter predicate set
  
  let foreach (set : 'a t) (function_to_execute : 'a -> unit) : unit =
    List.iter function_to_execute set
  
  let for_all (set : 'a t) (predicate : 'a -> bool) : bool =
    List.for_all predicate set
  
  let exists (set : 'a t) (predicate : 'a -> bool) : bool =
    List.exists predicate set
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