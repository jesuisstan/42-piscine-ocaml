module App = struct
  type project = string * string * int
  let zero : project = ("", "", 0)
  let combine ((n1, s1, g1) : project) ((n2, s2, g2) : project) : project =
    let name = n1 ^ n2 in
    let status = if ((g1 + g2) / 2) > 80 then "succeed" else "fail" in
    let grade = (g1 + g2) / 2 in
    (name, status, grade)
  let fail ((n, _, _) : project) : project = (n, "fail", 0)
  let success ((n, _, _) : project) : project = (n, "succeed", 80)
end

let print_proj (p : App.project) =
  let (n, s, g) = p in
  Printf.printf "Project: %s | Status: %s | Grade: %d\n" n s g

(* Test block *)
let () =
  let open App in
  let p1 = ("Piscine", "succeed", 90) in
  let p2 = ("OCaml", "fail", 70) in
  let p3 = combine p1 p2 in
  print_proj p3;
  print_proj (fail p1);
  print_proj (success p2);
  print_proj zero

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ex01.ml -o ex01                                                 *)
(* $ ./ex01                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ex01.ml";;                                                         *)
(* # open App;;                                                                *)
(* # let p1 = ("Piscine", "succeed", 90);;                                  *)
(* val p1 : App.project = ("Piscine", "succeed", 90)                        *)
(* # let p2 = ("OCaml", "fail", 70);;                                       *)
(* val p2 : App.project = ("OCaml", "fail", 70)                             *)
(* # combine p1 p2;;                                                           *)
(* - : App.project = ("PiscineOCaml", "succeed", 80)                        *)
(*                                                                            *)
(* ************************************************************************** *) 