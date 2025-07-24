(* ************************************************************************** *)
(*                                                                            *)
(* main.ml                                                                    *)
(* Exercise 00: Cards colors                                                  *)
(* Tests for Color module                                                    *)
(*                                                                            *)
(* ************************************************************************** *)

let print_color_info color =
  Printf.printf "Color: %-6s (short: %s)\n" 
    (Color.toStringVerbose color) (Color.toString color)

let main () =
  print_endline "# Testing Color module:";
  print_endline "\n# Testing all colors:";
  List.iter print_color_info Color.all;
  
  print_endline "\n# Testing individual colors:";
  print_color_info Color.Spade;
  print_color_info Color.Heart;
  print_color_info Color.Diamond;
  print_color_info Color.Club

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt Color.ml main.ml -o color                                      *)
(* $ ./color                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "Color.ml";;                                                        *)
(* # Color.toString Color.Spade;;                                              *)
(* - : string = "S"                                                          *)
(* # Color.toStringVerbose Color.Heart;;                                       *)
(* - : string = "Heart"                                                      *)
(*                                                                            *)
(* ************************************************************************** *) 