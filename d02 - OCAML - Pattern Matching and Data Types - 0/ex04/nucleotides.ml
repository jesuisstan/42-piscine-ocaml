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

let string_of_nucleobase = function
  | A -> "A"
  | T -> "T"
  | C -> "C"
  | G -> "G"
  | None -> "None"

let print_nucleotide n =
  Printf.printf "{ phosphate = \"%s\"; deoxyribose = \"%s\"; base = %s }\n"
    n.phosphate n.deoxyribose (string_of_nucleobase n.base)

let main () =
  print_endline "# Test cases:";
  print_string "generate_nucleotide 'A' = ";
  print_nucleotide (generate_nucleotide 'A');
  print_string "generate_nucleotide 'T' = ";
  print_nucleotide (generate_nucleotide 'T');
  print_string "generate_nucleotide 'C' = ";
  print_nucleotide (generate_nucleotide 'C');
  print_string "generate_nucleotide 'G' = ";
  print_nucleotide (generate_nucleotide 'G');
  print_string "generate_nucleotide 'X' = ";
  print_nucleotide (generate_nucleotide 'X')

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt nucleotides.ml -o nucleotides                                  *)
(* $ ./nucleotides                                                            *)
(*                                                                            *)
(* ************************************************************************** *) 