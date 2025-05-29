(* ************************************************************************** *)
(*                                                                            *)
(* ft_print_comb2.ml                                                         *)
(* Exercise 09: Print combinations of two two-digit numbers                  *)
(* Allowed functions: print_char, print_int                                 *)
(*                                                                            *)
(* ************************************************************************** *)

(* Prints all combinations of two two-digit numbers (00-99) in ascending order.
   Each combination is separated by ", " except the last one.
   First number is always less than second number. *)

let ft_print_comb2 () =
  let print_number n =
    if n < 10 then begin
      print_int 0;
      print_int n
    end else
      print_int n
  in
  let print_pair a b =
    print_number a;
    print_char ' ';
    print_number b;
    if a <> 98 || b <> 99 then
      print_string ", "
  in
  let rec loop a b =
    if a <= 98 then
      if b <= 99 then begin
        print_pair a b;
        if b < 99 then
          loop a (b + 1)
        else
          loop (a + 1) (a + 2)
      end
  in
  loop 0 1;
  print_char '\n'

(* Test case *)
let () =
  ft_print_comb2 ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ft_print_comb2.ml -o ft_print_comb2                           *)
(* $ ./ft_print_comb2                                                        *)
(*                                                                            *)
(* ************************************************************************** *) 