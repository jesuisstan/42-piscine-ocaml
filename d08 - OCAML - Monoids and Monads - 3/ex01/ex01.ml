module App = struct
  type project = string * string * int
  let zero : project = ("", "", 0)
  let combine ((name1, status1, grade1) : project) ((name2, status2, grade2) : project) : project =
    let name = name1 ^ name2 in
    let status = if ((grade1 + grade2) / 2) > 80 then "succeed" else "fail" in
    let grade = (grade1 + grade2) / 2 in
    (name, status, grade)
  let fail ((name, _, _) : project) : project = (name, "fail", 0)
  let success ((name, _, _) : project) : project = (name, "succeed", 80)
end

let print_proj (project : App.project) =
  let (name, status, grade) = project in
  Printf.printf "Project: %s | Status: %s | Grade: %d\n" name status grade

(* Test block *)
let () =
  let open App in
  let p1 = ("Piscine", "succeed", 90) in
  let p2 = ("OCaml", "fail", 40) in
  let p3 = combine p1 p2 in
  print_proj p3;
  print_proj (fail p1);
  print_proj (success p2);
  print_proj zero 