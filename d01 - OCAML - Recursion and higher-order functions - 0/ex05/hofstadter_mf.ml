(* ************************************************************************** *)
(*                                                                            *)
(* hofstadter_mf.ml                                                          *)
(* Exercise 05: Hofstadter Female and Male sequences                         *)
(* Allowed functions: None                                                   *)
(*                                                                            *)
(* ************************************************************************** *)

(* Hofstadter Female sequence:
   F(0) = 1
   F(n) = n - M(F(n-1)) for n > 0 *)
let rec hfs_f n =
  if n < 0 then -1
  else if n = 0 then 1
  else n - hfs_m (hfs_f (n - 1))

(* Hofstadter Male sequence:
   M(0) = 0
   M(n) = n - F(M(n-1)) for n > 0 *)
and hfs_m n =
  if n < 0 then -1
  else if n = 0 then 0
  else n - hfs_f (hfs_m (n - 1))

(* Test cases *)
let () =
  let test_sequence name f n =
    print_string (name ^ "(" ^ string_of_int n ^ ") = ");
    print_int (f n);
    print_char '\n'
  in
  (* Test cases from subject *)
  test_sequence "M" hfs_m 0;  (* Should print 0 *)
  test_sequence "F" hfs_f 0;  (* Should print 1 *)
  test_sequence "M" hfs_m 4;  (* Should print 2 *)
  test_sequence "F" hfs_f 4;  (* Should print 3 *)
  
  (* Additional test cases *)
  test_sequence "M" hfs_m (-1);  (* Should print -1 *)
  test_sequence "F" hfs_f (-1);  (* Should print -1 *)
  test_sequence "M" hfs_m 1;     (* Additional test *)
  test_sequence "F" hfs_f 1      (* Additional test *)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt hofstadter_mf.ml -o hofstadter_mf                             *)
(* $ ./hofstadter_mf                                                         *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "hofstadter_mf.ml";;                                               *)
(* # hfs_f 4;;                                                                 *)
(* - : int = 3                                                                *)
(* # hfs_m 4;;                                                                 *)
(* - : int = 2                                                                *)
(*                                                                            *)
(* ************************************************************************** *) 