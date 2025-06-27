(* ************************************************************************** *)
(*                                                                            *)
(*                               d08 - ex00                                   *)
(*                                                                            *)
(*   Watchtower: 12-hour clock monoid                                         *)
(*                                                                            *)
(* ************************************************************************** *)

module Watchtower = struct
  type hour = int
  let zero : hour = 0
  let add (h1 : hour) (h2 : hour) : hour =
    let sum = (h1 + h2) mod 12 in
    if sum = 0 then 12 else sum
  let sub (h1 : hour) (h2 : hour) : hour =
    let diff = (h1 - h2) mod 12 in
    let d = if diff <= 0 then diff + 12 else diff in
    if d = 12 then 12 else d
end

(* Test block *)
let () =
  let open Watchtower in
  Printf.printf "add 10 3 = %d\n" (add 10 3);   (* 1 *)
  Printf.printf "add 6 6 = %d\n" (add 6 6);     (* 12 *)
  Printf.printf "sub 3 5 = %d\n" (sub 3 5);     (* 10 *)
  Printf.printf "sub 12 1 = %d\n" (sub 12 1);   (* 11 *)
  Printf.printf "add 12 12 = %d\n" (add 12 12); (* 12 *)
  Printf.printf "zero = %d\n" zero

(* Compile: ocamlopt ex00.ml -o ex00 *)
(* Run: ./ex00 *) 