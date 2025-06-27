(* ************************************************************************** *)
(*                                                                            *)
(*                               d05 - ex01                                   *)
(*                                                                            *)
(*   The Hashtbl module and the Hashtbl.Make functor                          *)
(*                                                                            *)
(* ************************************************************************** *)

(* This exercise demonstrates the use of the Hashtbl.Make functor to create a hash table of strings. *)

module StringHashtbl = Hashtbl.Make(struct
  type t = string
  let equal = String.equal
  let hash = Hashtbl.hash
end)

let () =
  let ht = StringHashtbl.create 5 in
  let values = ["Hello"; "world"; "42"; "Ocaml"; "H"] in
  let pairs = List.map (fun s -> (s, String.length s)) values in
  List.iter (fun (k, v) -> StringHashtbl.add ht k v) pairs;
  StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o ex01 ex01.ml                                                 *)
(* $ ./ex01                                                                  *)
(*                                                                            *)
(* ************************************************************************** *) 