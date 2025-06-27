(* ************************************************************************** *)
(*                                                                            *)
(*                               d08 - ex02                                   *)
(*                                                                            *)
(*   INT, FLOAT monoids and Calc functor                                      *)
(*                                                                            *)
(* ************************************************************************** *)

module type MONOID = sig
  type element
  val zero1 : element
  val zero2 : element
  val add : element -> element -> element
  val sub : element -> element -> element
  val mul : element -> element -> element
  val div : element -> element -> element
end

module INT : MONOID = struct
  type element = int
  let zero1 = 0
  let zero2 = 1
  let add = ( + )
  let sub = ( - )
  let mul = ( * )
  let div = ( / )
end

module FLOAT : MONOID = struct
  type element = float
  let zero1 = 0.0
  let zero2 = 1.0
  let add = ( +. )
  let sub = ( -. )
  let mul = ( *. )
  let div = ( /. )
end

module Calc (M : MONOID) = struct
  let add = M.add
  let sub = M.sub
  let mul = M.mul
  let div = M.div
  let rec power x n =
    if n <= 0 then M.zero2 else M.mul x (power x (n-1))
  let rec fact x =
    if x = M.zero1 then M.zero2 else M.mul x (fact (M.sub x M.zero2))
end

let () =
  let module Calc_int = Calc(INT) in
  let module Calc_float = Calc(FLOAT) in
  Printf.printf "%d\n" (Calc_int.power 3 3);
  Printf.printf "%f\n" (Calc_float.power 3.0 3);
  Printf.printf "%d\n" (Calc_int.mul (Calc_int.add 20 1) 2);
  Printf.printf "%f\n" (Calc_float.mul (Calc_float.add 20.0 1.0) 2.0)

(* Compile: ocamlopt ex02.ml -o ex02 *)
(* Run: ./ex02 *) 