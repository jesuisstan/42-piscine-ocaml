(* ************************************************************************** *)
(*                                                                            *)
(*                               d07 - ex01                                   *)
(*                                                                            *)
(*   Virtual class: molecule and concrete molecules                            *)
(*                                                                            *)
(* ************************************************************************** *)

open Ex00_atom

let hill_notation atoms =
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

class virtual molecule (name_init:string) (atoms_init:atom list) = object
  method virtual name : string
  method virtual formula : string
  method atoms : atom list = atoms_init
  method to_string = Printf.sprintf "<molecule: name=%s, formula=%s>" self#name self#formula
  method equals (other : molecule) = self#formula = other#formula
end

class water = object
  inherit molecule "Water" [new hydrogen; new hydrogen; new oxygen]
  method name = "Water"
  method formula = hill_notation self#atoms
end

class carbon_dioxide = object
  inherit molecule "Carbon dioxide" [new carbon; new oxygen; new oxygen]
  method name = "Carbon dioxide"
  method formula = hill_notation self#atoms
end

class ammonia = object
  inherit molecule "Ammonia" ([new nitrogen] @ [new hydrogen; new hydrogen; new hydrogen])
  method name = "Ammonia"
  method formula = hill_notation self#atoms
end

class sodium_chloride = object
  inherit molecule "Sodium chloride" [new sodium; new chlorine]
  method name = "Sodium chloride"
  method formula = hill_notation self#atoms
end

class ozone = object
  inherit molecule "Ozone" [new oxygen; new oxygen; new oxygen]
  method name = "Ozone"
  method formula = hill_notation self#atoms
end

(* ************************************************************************** *)
(*                                                                            *)
(* Test code                                                                  *)
(*                                                                            *)
(* ************************************************************************** *)

let () =
  let m1 = new water in
  let m2 = new carbon_dioxide in
  let m3 = new ammonia in
  let m4 = new sodium_chloride in
  let m5 = new ozone in
  let ms = [m1; m2; m3; m4; m5] in
  List.iter (fun m -> print_endline (m#to_string)) ms;
  Printf.printf "Water equals Ozone? %b\n" (m1#equals m5);
  Printf.printf "Water equals Water? %b\n" (m1#equals (new water))

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o molecule ex00/atom.ml molecule.ml                            *)
(* $ ./molecule                                                              *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ex00/atom.ml";;                                                    *)
(* # #use "molecule.ml";;                                                      *)
(* # let water = new water;;                                                   *)
(* val water : water = <obj>                                                   *)
(* # water#to_string;;                                                         *)
(* - : string = "<molecule: name=Water, formula=H2O>"                        *)
(* # let co2 = new carbon_dioxide;;                                            *)
(* val co2 : carbon_dioxide = <obj>                                            *)
(* # co2#formula;;                                                             *)
(* - : string = "CO2"                                                        *)
(*                                                                            *)
(* ************************************************************************** *) 