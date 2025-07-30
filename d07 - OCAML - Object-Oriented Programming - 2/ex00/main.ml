(* Test atom classes *)

let () =
  print_endline "=== Testing Atom Classes ===";
  
  (* Test basic atoms *)
  let h = new Atom.hydrogen in
  let c = new Atom.carbon in
  let o = new Atom.oxygen in
  let n = new Atom.nitrogen in
  let na = new Atom.sodium in
  let cl = new Atom.chlorine in
  
  print_endline (h#to_string);
  print_endline (c#to_string);
  print_endline (o#to_string);
  print_endline (n#to_string);
  print_endline (na#to_string);
  print_endline (cl#to_string);
  
  (* Test bonus atoms *)
  let p = new Atom.phosphorus in
  let s = new Atom.sulfur in
  let k = new Atom.potassium in
  let ca = new Atom.calcium in
  let fe = new Atom.iron in
  
  print_endline "\n=== Bonus Atoms ===";
  print_endline (p#to_string);
  print_endline (s#to_string);
  print_endline (k#to_string);
  print_endline (ca#to_string);
  print_endline (fe#to_string);
  
  (* Test equals method *)
  print_endline "\n=== Testing Equals Method ===";
  let h2 = new Atom.hydrogen in
  print_endline (Printf.sprintf "Hydrogen equals Hydrogen: %b" (h#equals h2));
  print_endline (Printf.sprintf "Hydrogen equals Carbon: %b" (h#equals c)) 