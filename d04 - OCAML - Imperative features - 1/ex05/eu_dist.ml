let eu_dist a b =
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
  Printf.printf "eu_dist [1.0;2.0;3.0] [4.0;6.0;8.0] = %f\n" (eu_dist a b);
  let c = [|0.0; 0.0|] in
  let d = [|0.0; 0.0|] in
  Printf.printf "eu_dist [0.0;0.0] [0.0;0.0] = %f\n" (eu_dist c d)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o eu_dist eu_dist.ml                                           *)
(* $ ./eu_dist                                                                *)
(*                                                                            *)
(* ************************************************************************** *) 