(* ************************************************************************** *)
(*                                                                            *)
(*                               d05 - ex02                                   *)
(*                                                                            *)
(*   Projections (functors)                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* This exercise demonstrates the use of functors to project the first and second elements of a pair. *)

module type PAIR = sig val pair : int * int end
module type VAL = sig val x : int end

module MakeFst (P : PAIR) : VAL = struct let x = fst P.pair end
module MakeSnd (P : PAIR) : VAL = struct let x = snd P.pair end

module Pair : PAIR = struct let pair = (21, 42) end
module Fst : VAL = MakeFst(Pair)
module Snd : VAL = MakeSnd(Pair)

let () = Printf.printf "Fst.x = %d, Snd.x = %d\n" Fst.x Snd.x

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o ex02 ex02.ml                                                 *)
(* $ ./ex02                                                                  *)
(*                                                                            *)
(* ************************************************************************** *) 