(* ************************************************************************** *)
(*                                                                            *)
(* ft_print_comb.ml                                                          *)
(* Exercise 04: Print combinations of three different digits                  *)
(* Allowed functions: print_int and print_string                            *)
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
(* $ ocamlopt ft_print_comb.ml -o ft_print_comb                             *)
(* $ ./ft_print_comb                                                         *)
(*                                                                            *)
(* ************************************************************************** *) 