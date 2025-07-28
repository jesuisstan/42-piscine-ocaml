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
  val gte : t -> t -> bool
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
  let of_float f = int_of_float (f *. float_of_int scale +. 0.5)
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
  let gte a b = a >= b
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
      else (f x; loop (x + 1))
    in
    loop from_
end

module Fixed4 = Make(struct let bits = 4 end)
module Fixed8 = Make(struct let bits = 8 end)

(* Additional test code to prove that EVERY requested function works as intended *)
let test_fixed_point () =
  Printf.printf "\n=== Additional Tests ===\n";
  
  (* Test of_float and to_float *)
  let f1 = Fixed8.of_float 3.14 in
  Printf.printf "of_float 3.14 = %s\n" (Fixed8.to_string f1);
  
  (* Test of_int and to_int *)
  let i1 = Fixed8.of_int 42 in
  Printf.printf "of_int 42 = %s\n" (Fixed8.to_string i1);
  Printf.printf "to_int %s = %d\n" (Fixed8.to_string i1) (Fixed8.to_int i1);
  
  (* Test zero and one *)
  Printf.printf "zero = %s\n" (Fixed8.to_string Fixed8.zero);
  Printf.printf "one = %s\n" (Fixed8.to_string Fixed8.one);
  
  (* Test succ and pred *)
  let x = Fixed8.of_float 5.0 in
  Printf.printf "succ %s = %s\n" (Fixed8.to_string x) (Fixed8.to_string (Fixed8.succ x));
  Printf.printf "pred %s = %s\n" (Fixed8.to_string x) (Fixed8.to_string (Fixed8.pred x));
  
  (* Test min and max *)
  let a = Fixed8.of_float 3.0 in
  let b = Fixed8.of_float 7.0 in
  Printf.printf "min %s %s = %s\n" (Fixed8.to_string a) (Fixed8.to_string b) (Fixed8.to_string (Fixed8.min a b));
  Printf.printf "max %s %s = %s\n" (Fixed8.to_string a) (Fixed8.to_string b) (Fixed8.to_string (Fixed8.max a b));
  
  (* Test comparison functions *)
  Printf.printf "gth %s %s = %b\n" (Fixed8.to_string b) (Fixed8.to_string a) (Fixed8.gth b a);
  Printf.printf "lth %s %s = %b\n" (Fixed8.to_string a) (Fixed8.to_string b) (Fixed8.lth a b);
  Printf.printf "gte %s %s = %b\n" (Fixed8.to_string b) (Fixed8.to_string a) (Fixed8.gte b a);
  Printf.printf "lte %s %s = %b\n" (Fixed8.to_string a) (Fixed8.to_string b) (Fixed8.lte a b);
  
  (* Test equality functions *)
  let c = Fixed8.of_float 3.0 in
  Printf.printf "eqp %s %s = %b\n" (Fixed8.to_string a) (Fixed8.to_string c) (Fixed8.eqp a c);
  Printf.printf "eqs %s %s = %b\n" (Fixed8.to_string a) (Fixed8.to_string c) (Fixed8.eqs a c);
  
  (* Test arithmetic operations *)
  let d = Fixed8.of_float 2.0 in
  Printf.printf "add %s %s = %s\n" (Fixed8.to_string a) (Fixed8.to_string d) (Fixed8.to_string (Fixed8.add a d));
  Printf.printf "sub %s %s = %s\n" (Fixed8.to_string b) (Fixed8.to_string d) (Fixed8.to_string (Fixed8.sub b d));
  Printf.printf "mul %s %s = %s\n" (Fixed8.to_string a) (Fixed8.to_string d) (Fixed8.to_string (Fixed8.mul a d));
  Printf.printf "div %s %s = %s\n" (Fixed8.to_string b) (Fixed8.to_string d) (Fixed8.to_string (Fixed8.div b d))

let () =
  let x8 = Fixed8.of_float 21.10 in
  let y8 = Fixed8.of_float 21.32 in
  let r8 = Fixed8.add x8 y8 in
  print_endline (Fixed8.to_string r8);
  Fixed4.foreach Fixed4.zero Fixed4.one (fun f -> print_endline (Fixed4.to_string f));
  test_fixed_point ()

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