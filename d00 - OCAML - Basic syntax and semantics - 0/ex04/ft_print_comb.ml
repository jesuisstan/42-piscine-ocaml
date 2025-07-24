(* ************************************************************************** *)
(*                                                                            *)
(* ft_print_comb.ml                                                           *)
(* Exercise 04: Print combinations of three different digits                  *)
(* Allowed functions: print_int and print_string                              *)
(*                                                                            *)
(* ************************************************************************** *)

(* Prints all combinations of three different digits in ascending order.
   Each combination is separated by ", " except the last one.
   Numbers within each combination are also in ascending order. *)

let ft_print_comb () =
  let print_triple i j k =
    print_int i;
    print_int j;
    print_int k;
    if i <> 7 || j <> 8 || k <> 9 then
      print_string ", "
  in
  let rec loop i j k =
    if i <= 7 then
      if j <= 8 then
        if k <= 9 then
          begin
            print_triple i j k;
            if k < 9 then
              loop i j (k + 1)
            else if j < 8 then
              loop i (j + 1) (j + 2)
            else
              loop (i + 1) (i + 2) (i + 3)
          end
  in
  loop 0 1 2;
  print_string "\n"

(* Test case *)
let () =
  ft_print_comb ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_print_comb.ml -o ft_print_comb                               *)
(* $ ./ft_print_comb                                                          *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ft_print_comb.ml";;                                                 *)
(* # ft_print_comb ();;                                                        *)
(* 012, 013, 014, 015, 016, 017, 018, 019, 023, 024, 025, 026, 027, 028, 029, 034, 035, 036, 037, 038, 039, 045, 046, 047, 048, 049, 056, 057, 058, 059, 067, 068, 069, 078, 079, 089, 123, 124, 125, 126, 127, 128, 129, 134, 135, 136, 137, 138, 139, 145, 146, 147, 148, 149, 156, 157, 158, 159, 167, 168, 169, 178, 179, 189, 234, 235, 236, 237, 238, 239, 245, 246, 247, 248, 249, 256, 257, 258, 259, 267, 268, 269, 278, 279, 289, 345, 346, 347, 348, 349, 356, 357, 358, 359, 367, 368, 369, 378, 379, 389, 456, 457, 458, 459, 467, 468, 469, 478, 479, 489, 567, 568, 569, 578, 579, 589, 678, 679, 689, 789 *)
(*                                                                            *)
(* ************************************************************************** *)