(* Main test file for ex00 - Atom classes *)

(* Test code *)
let () =
  let h = new Atom.hydrogen in
  let c = new Atom.carbon in
  let o = new Atom.oxygen in
  let n = new Atom.nitrogen in
  let na = new Atom.sodium in
  let cl = new Atom.chlorine in
  
  let atoms = [h; c; o; n; na; cl] in
  
  (* Test atom creation and to_string *)
  List.iter (fun atom -> print_endline (atom#to_string)) atoms;
  
  (* Test equals method *)
  Printf.printf "Hydrogen equals Carbon? %b\n" (h#equals c);
  Printf.printf "Hydrogen equals Hydrogen? %b\n" (h#equals (new Atom.hydrogen));
  
  (* Test individual properties *)
  Printf.printf "Hydrogen symbol: %s\n" h#symbol;
  Printf.printf "Carbon atomic number: %d\n" c#atomic_number;
  Printf.printf "Oxygen name: %s\n" o#name

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -c atom.ml                                                      *)
(* $ ocamlopt -o main atom.cmx main.ml                                        *)
(* $ ./main                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "atom.ml";;                                                         *)
(* # let h = new hydrogen;;                                                   *)
(* val h : hydrogen = <obj>                                                   *)
(* # h#to_string;;                                                            *)
(* - : string = "<atom: name=Hydrogen, symbol=H, atomic_number=1>"           *)
(*                                                                            *)
(* ************************************************************************** *) 