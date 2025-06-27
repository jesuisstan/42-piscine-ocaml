(* ************************************************************************** *)
(*                                                                            *)
(*                               d07 - ex00                                   *)
(*                                                                            *)
(*   Virtual class: atom and concrete atoms                                   *)
(*                                                                            *)
(* ************************************************************************** *)

class virtual atom = object
  method virtual name : string
  method virtual symbol : string
  method virtual atomic_number : int
  method to_string =
    Printf.sprintf "<atom: name=%s, symbol=%s, atomic_number=%d>" self#name self#symbol self#atomic_number
  method equals (other : atom) =
    self#name = other#name && self#symbol = other#symbol && self#atomic_number = other#atomic_number
end

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

class oxygen = object
  inherit atom
  method name = "Oxygen"
  method symbol = "O"
  method atomic_number = 8
end

class nitrogen = object
  inherit atom
  method name = "Nitrogen"
  method symbol = "N"
  method atomic_number = 7
end

class sodium = object
  inherit atom
  method name = "Sodium"
  method symbol = "Na"
  method atomic_number = 11
end

class chlorine = object
  inherit atom
  method name = "Chlorine"
  method symbol = "Cl"
  method atomic_number = 17
end

(* ************************************************************************** *)
(*                                                                            *)
(* Test code                                                                  *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let h = new hydrogen in
  let c = new carbon in
  let o = new oxygen in
  let n = new nitrogen in
  let na = new sodium in
  let cl = new chlorine in
  let atoms = [h; c; o; n; na; cl] in
  List.iter (fun a -> print_endline (a#to_string)) atoms;
  Printf.printf "Hydrogen equals Carbon? %b\n" (h#equals c);
  Printf.printf "Hydrogen equals Hydrogen? %b\n" (h#equals (new hydrogen))

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o atom atom.ml                                                 *)
(* $ ./atom                                                                   *)
(*                                                                            *)
(* ************************************************************************** *) 