(* ************************************************************************** *)
(*                                                                            *)
(*                               d07 - ex02                                   *)
(*                                                                            *)
(*   Class: alkane and concrete alkanes                                       *)
(*                                                                            *)
(* ************************************************************************** *)

open Ex01_molecule

exception Invalid_alkane_n of int

class alkane n =
  object
    inherit molecule (Printf.sprintf "Alkane_%d" n) []
    val n_c = n
    val n_h = 2 * n + 2
    method name =
      match n with
      | 1 -> "Methane"
      | 2 -> "Ethane"
      | 8 -> "Octane"
      | _ -> Printf.sprintf "Alkane_%d" n
    method formula =
      if n < 1 || n > 12 then raise (Invalid_alkane_n n)
      else Printf.sprintf "C%dH%d" n_c n_h
    method to_string = Printf.sprintf "<alkane: name=%s, formula=%s>" self#name self#formula
    method equals (other : alkane) = self#formula = other#formula
  end

let methane = new alkane 1
let ethane = new alkane 2
let octane = new alkane 8

(* ************************************************************************** *)
(*                                                                            *)
(* Test code                                                                  *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let alkanes = [methane; ethane; octane] in
  List.iter (fun a -> print_endline (a#to_string)) alkanes;
  Printf.printf "Methane equals Ethane? %b\n" (methane#equals ethane);
  Printf.printf "Methane equals Methane? %b\n" (methane#equals (new alkane 1));
  (try ignore (new alkane 0) with Invalid_alkane_n n -> Printf.printf "Invalid n: %d\n" n)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o alkane ex00/atom.ml ex01/molecule.ml alkane.ml               *)
(* $ ./alkane                                                                 *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ex00/atom.ml";;                                                    *)
(* # #use "ex01/molecule.ml";;                                                 *)
(* # #use "alkane.ml";;                                                        *)
(* # let methane = new alkane 1;;                                               *)
(* val methane : alkane = <obj>                                                 *)
(* # methane#to_string;;                                                        *)
(* - : string = "<alkane: name=Methane, formula=CH4>"                         *)
(* # methane#formula;;                                                          *)
(* - : string = "CH4"                                                         *)
(*                                                                            *)
(* ************************************************************************** *) 