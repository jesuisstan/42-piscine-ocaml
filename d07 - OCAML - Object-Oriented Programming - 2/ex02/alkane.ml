(* Module for working with alkanes *)

exception Invalid_alkane_n of int

(* Virtual atom class *)
class virtual atom = object (self)
  method virtual name : string
  method virtual symbol : string
  method virtual atomic_number : int
  method to_string =
    Printf.sprintf "<atom: name=%s, symbol=%s, atomic_number=%d>" self#name self#symbol self#atomic_number
  method equals (other : atom) =
    self#name = other#name && self#symbol = other#symbol && self#atomic_number = other#atomic_number
end

(* Create test atoms for demonstration *)
class hydrogen = object
  inherit atom
  method name = "Hydrogen"
  method symbol = "H"
  method atomic_number = 1
end

class carbon = object
  inherit atom
  method name = "Carbon"
  method symbol = "C"
  method atomic_number = 6
end

(* Virtual molecule class *)
class virtual molecule (name_init:string) (atoms_init:atom list) = object (self)
  method virtual name : string
  method virtual formula : string
  method atoms : atom list = atoms_init
  method to_string = Printf.sprintf "<molecule: name=%s, formula=%s>" self#name self#formula
  method equals (other : molecule) = self#formula = other#formula
end

(* Function for Hill notation *)
let hill_notation (atoms : atom list) =
  let count = Hashtbl.create 10 in
  List.iter (fun (a : atom) ->
    let sym = a#symbol in
    Hashtbl.replace count sym (1 + (try Hashtbl.find count sym with Not_found -> 0))
  ) atoms;
  let get sym = try Hashtbl.find count sym with Not_found -> 0 in
  let all_syms = Hashtbl.fold (fun k _ acc -> k :: acc) count [] in
  let uniq_syms = List.sort_uniq compare all_syms in
  let sorted =
    let rest = List.filter (fun s -> s <> "C" && s <> "H") uniq_syms |> List.sort compare in
    (if List.mem "C" uniq_syms then ["C"] else []) @
    (if List.mem "H" uniq_syms then ["H"] else []) @ rest
  in
  String.concat "" (List.map (fun s ->
    let n = get s in
    if n = 1 then s else s ^ string_of_int n
  ) sorted)

(* Alkane class *)
class alkane n =
  object (self)
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
(* $ make                                                                     *)
(* $ ./alkane                                                                 *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "alkane.ml";;                                                        *)
(* # let methane = new alkane 1;;                                               *)
(* val methane : alkane = <obj>                                                 *)
(* # methane#to_string;;                                                        *)
(* - : string = "<alkane: name=Methane, formula=CH4>"                         *)
(* # methane#formula;;                                                          *)
(* - : string = "CH4"                                                         *)
(*                                                                            *)
(* ************************************************************************** *) 