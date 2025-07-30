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
  let three_int = (Obj.magic 3 : INT.element) in
  let three_float = (Obj.magic 3.0 : FLOAT.element) in
  let twenty_int = (Obj.magic 20 : INT.element) in
  let one_int = (Obj.magic 1 : INT.element) in
  let two_int = (Obj.magic 2 : INT.element) in
  let twenty_float = (Obj.magic 20.0 : FLOAT.element) in
  let one_float = (Obj.magic 1.0 : FLOAT.element) in
  let two_float = (Obj.magic 2.0 : FLOAT.element) in
  Printf.printf "%d\n" (Obj.magic (Calc_int.power three_int 3));
  Printf.printf "%f\n" (Obj.magic (Calc_float.power three_float 3));
  Printf.printf "%d\n" (Obj.magic (Calc_int.mul (Calc_int.add twenty_int one_int) two_int));
  Printf.printf "%f\n" (Obj.magic (Calc_float.mul (Calc_float.add twenty_float one_float) two_float))

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ex02.ml -o ex02                                                 *)
(* $ ./ex02                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ex02.ml";;                                                         *)
(* # let module Calc_int = Calc(INT);;                                          *)
(* module Calc_int : sig ... end                                                *)
(* # Calc_int.power 3 3;;                                                       *)
(* - : int = 27                                                               *)
(* # Calc_int.mul (Calc_int.add 20 1) 2;;                                     *)
(* - : int = 42                                                               *)
(*                                                                            *)
(* ************************************************************************** *) 