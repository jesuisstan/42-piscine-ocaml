let eu_dist : float array -> float array -> float = fun a b ->
  if Array.length a <> Array.length b then invalid_arg "eu_dist: arrays must have the same length";
  let sum = ref 0.0 in
  for i = 0 to Array.length a - 1 do
    let d = a.(i) -. b.(i) in
    sum := !sum +. d *. d
  done;
  sqrt !sum

let () =
  let a = [|1.0; 2.0; 3.0|] in
  let b = [|4.0; 6.0; 8.0|] in
  Printf.printf "Euclidian distance between [1.0;2.0;3.0] and [4.0;6.0;8.0] = %f\n" (eu_dist a b);
  let c = [|0.0; 0.0|] in
  let d = [|0.0; 0.0|] in
  Printf.printf "Euclidian distance between [0.0;0.0] and [0.0;0.0] = %f\n" (eu_dist c d);

  Printf.printf "--------------------------------\n";
  Printf.printf "Testing eu_dist with different lengths: [1.0;2.0] and [1.0;2.0;3.0]\n";
  let e = [|1.0; 2.0|] in
  let f = [|1.0; 2.0; 3.0|] in
  Printf.printf "Euclidian distance between [1.0;2.0] and [1.0;2.0;3.0] = %f\n" (eu_dist e f)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o eu_dist eu_dist.ml                                           *)
(* $ ./eu_dist                                                                *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "eu_dist.ml";;                                                      *)
(* # let a = [|1.0; 2.0; 3.0|];;                                              *)
(* val a : float array = [|1.; 2.; 3.|]                                       *)
(* # let b = [|4.0; 6.0; 8.0|];;                                              *)
(* val b : float array = [|4.; 6.; 8.|]                                       *)
(* # eu_dist a b;;                                                             *)
(* - : float = 5.385242                                                       *)
(*                                                                            *)
(* ************************************************************************** *) 