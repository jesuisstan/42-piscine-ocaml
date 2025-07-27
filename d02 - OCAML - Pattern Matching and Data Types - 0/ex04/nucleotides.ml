(* ************************************************************************** *)
(*                                                                            *)
(* nucleotides.ml                                                            *)
(* Exercise 04: DNA nucleotide types and generation                          *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Type definitions for DNA nucleotides *)

type phosphate = string
type deoxyribose = string
type nucleobase = A | T | C | G | None
type nucleotide = {
  phosphate: phosphate;
  deoxyribose: deoxyribose;
  base: nucleobase;
}

(* Generate nucleotide from char *)
let generate_nucleotide c =
  let base = match c with
    | 'A' -> A
    | 'T' -> T
    | 'C' -> C
    | 'G' -> G
    | _ -> None
  in
  {
    phosphate = "phosphate";
    deoxyribose = "deoxyribose";
    base = base;
  }

let string_of_nucleobase base = match base with
  | A -> "A"
  | T -> "T"
  | C -> "C"
  | G -> "G"
  | None -> "None"

let print_nucleotide n =
  print_string "{ phosphate = \"";
  print_string n.phosphate;
  print_string "\"; deoxyribose = \"";
  print_string n.deoxyribose;
  print_string "\"; base = ";
  print_string (string_of_nucleobase n.base);
  print_endline " }"

(* Handler function to demonstrate types and generate_nucleotide *)
let handle_nucleotide c =
  let result = generate_nucleotide c in
  print_string "generate_nucleotide '";
  print_char c;
  print_string "' = ";
  print_nucleotide result

let main () =
  print_endline "# Test cases:";
  handle_nucleotide 'A';
  handle_nucleotide 'T';
  handle_nucleotide 'C';
  handle_nucleotide 'G';
  handle_nucleotide 'X'

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt nucleotides.ml -o nucleotides                                  *)
(* $ ./nucleotides                                                            *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "nucleotides.ml";;                                                 *)
(* # generate_nucleotide 'A';;                                                 *)
(* - : nucleotide = {phosphate = "phosphate"; deoxyribose = "deoxyribose"; base = A} *)
(* # generate_nucleotide 'X';;                                                 *)
(* - : nucleotide = {phosphate = "phosphate"; deoxyribose = "deoxyribose"; base = None} *)
(*                                                                            *)
(* ************************************************************************** *) 