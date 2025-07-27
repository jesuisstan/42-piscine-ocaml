(* ************************************************************************** *)
(*                                                                            *)
(*                               d05 - ex03                                   *)
(*                                                                            *)
(*   Fixed point functor                                                      *)
(*                                                                            *)
(* ************************************************************************** *)

(* This exercise demonstrates the use of a functor to create fixed-point arithmetic modules. *)

module type FIXED = sig
  type t
  val of_float : float -> t
  val of_int : int -> t
  val to_float : t -> float
  val to_int : t -> int
  val to_string : t -> string
  val zero : t
  val one : t
  val succ : t -> t
  val pred : t -> t
  val min : t -> t -> t
  val max : t -> t -> t
  val gth : t -> t -> bool
  val lth : t -> t -> bool
  val lte : t -> t -> bool
  val eqp : t -> t -> bool
  val eqs : t -> t -> bool
  val add : t -> t -> t
  val sub : t -> t -> t
  val mul : t -> t -> t
  val div : t -> t -> t
  val foreach : t -> t -> (t -> unit) -> unit
end

module type FRACTIONAL_BITS = sig val bits : int end

module Make (F : FRACTIONAL_BITS) : FIXED = struct
  type t = int
  let bits = F.bits
  let scale = 1 lsl bits
  let of_float f = int_of_float (f *. float_of_int scale)
  let of_int i = i * scale
  let to_float t = float_of_int t /. float_of_int scale
  let to_int t = t / scale
  let to_string t = string_of_float (to_float t)
  let zero = 0
  let one = scale
  let succ t = t + 1
  let pred t = t - 1
  let min a b = if a < b then a else b
  let max a b = if a > b then a else b
  let gth a b = a > b
  let lth a b = a < b
  let lte a b = a <= b
  let eqp a b = a == b
  let eqs a b = a = b
  let add a b = a + b
  let sub a b = a - b
  let mul a b = (a * b) / scale
  let div a b = (a * scale) / b
  let foreach from_ to_ f =
    let rec loop x =
      if x > to_ then ()
      else (f x; loop (x + one))
    in
    loop from_
end

module Fixed4 = Make(struct let bits = 4 end)
module Fixed8 = Make(struct let bits = 8 end)

let () =
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);
  Fixed4.foreach Fixed4.zero Fixed4.one (fun f -> print_endline (Fixed4.to_string f))

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ex03.ml && ./a.out                                              *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                    *)
(* # #use "ex03.ml";;                                                         *)
(* # let x8 = Fixed8.of_float 21.10;;                                         *)
(* val x8 : Fixed8.t = 5402                                                   *)
(* # let y8 = Fixed8.of_float 21.32;;                                         *)
(* val y8 : Fixed8.t = 5458                                                   *)
(* # Fixed8.to_string (Fixed8.add x8 y8);;                                    *)
(* - : string = "42.42"                                                       *)
(*                                                                            *)
(* ************************************************************************** *) 