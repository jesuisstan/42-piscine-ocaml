module type MONOID = sig
  type element
  val zero1 : element (* Neutral element for addition *)
  val zero2 : element (* Neutral element for multiplication *)
  val mul : element -> element -> element
  val add : element -> element -> element
  val div : element -> element -> element
  val sub : element -> element -> element
end

module INT = struct
  type element = int
  let zero1 = 0 (* Neutral element for addition *)
  let zero2 = 1 (* Neutral element for multiplication *)
  let add = ( + )
  let sub = ( - )
  let mul = ( * )
  let div = ( / )
end

module FLOAT = struct
  type element = float
  let zero1 = 0.0 (* Neutral element for addition *)
  let zero2 = 1.0 (* Neutral element for multiplication *)
  let add = ( +. )
  let sub = ( -. )
  let mul = ( *. )
  let div = ( /. )
end

module Calc (M : MONOID) = struct
  let add : M.element -> M.element -> M.element = M.add
  let sub : M.element -> M.element -> M.element = M.sub
  let mul : M.element -> M.element -> M.element = M.mul
  let div : M.element -> M.element -> M.element = M.div
  let rec power (base : M.element) (exponent : int) : M.element =
    if exponent <= 0 then M.zero2
    else M.mul base (power base (exponent-1))
  let rec fact (number : M.element) : M.element =
    if number = M.zero1 then M.zero2
    else M.mul number (fact (M.sub number M.zero2))
end

module Calc_int = Calc(INT)
module Calc_float = Calc(FLOAT)

(* Test block - original subject tests + missing function tests *)
let () =
  print_endline "Original subject tests:";
  print_endline ("3^3 = " ^ string_of_int (Calc_int.power 3 3));
  print_endline ("3.0^3 = " ^ string_of_float (Calc_float.power 3.0 3));
  print_endline ("(20+1)*2 = " ^ string_of_int (Calc_int.mul (Calc_int.add 20 1) 2));
  print_endline ("(20.0+1.0)*2.0 = " ^ string_of_float (Calc_float.mul (Calc_float.add 20.0 1.0) 2.0));
  print_endline "Additional function tests:";
  print_endline ("10 - 4 = " ^ string_of_int (Calc_int.sub 10 4));
  print_endline ("20 / 5 = " ^ string_of_int (Calc_int.div 20 5));
  print_endline ("10.0 - 4.5 = " ^ string_of_float (Calc_float.sub 10.0 4.5));
  print_endline ("20.0 / 5.0 = " ^ string_of_float (Calc_float.div 20.0 5.0));
  print_endline ("5! = " ^ string_of_int (Calc_int.fact 5));
  print_endline ("5.0! = " ^ string_of_float (Calc_float.fact 5.0));
  print_endline ("0! = " ^ string_of_int (Calc_int.fact 0));
  print_endline ("0.0! = " ^ string_of_float (Calc_float.fact 0.0))