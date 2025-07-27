(* ************************************************************************** *)
(*                                                                            *)
(* main.ml                                                                    *)
(* Exercise 02: Cards                                                         *)
(* Tests for Card module                                                     *)
(*                                                                            *)
(* ************************************************************************** *)

let print_card_info card =
  Printf.printf "Card: %-20s (short: %s)\n"
    (Card.toStringVerbose card) (Card.toString card)

let test_compare c1 c2 =
  Printf.printf "compare %s and %s = %d\n"
    (Card.toString c1) (Card.toString c2) (Card.compare c1 c2)

let test_max c1 c2 =
  Printf.printf "max %s and %s = %s\n"
    (Card.toString c1) (Card.toString c2)
    (Card.toString (Card.max c1 c2))

let test_min c1 c2 =
  Printf.printf "min %s and %s = %s\n"
    (Card.toString c1) (Card.toString c2)
    (Card.toString (Card.min c1 c2))

let test_best cards =
  try
    Printf.printf "best of [%s] = %s\n"
      (String.concat "; " (List.map Card.toString cards))
      (Card.toString (Card.best cards))
  with Invalid_argument msg -> Printf.printf "best [] -> %s\n" msg

let test_color_predicates card =
  Printf.printf "%s is: spade=%B heart=%B diamond=%B club=%B\n"
    (Card.toString card)
    (Card.isSpade card) (Card.isHeart card)
    (Card.isDiamond card) (Card.isClub card)

let main () =
  print_endline "# Testing Card module:";
  
  print_endline "\n# Testing card creation and string conversion:";
  let ace_spades = Card.newCard Card.Value.As Card.Color.Spade in
  let king_hearts = Card.newCard Card.Value.King Card.Color.Heart in
  let ten_diamonds = Card.newCard Card.Value.T10 Card.Color.Diamond in
  print_card_info ace_spades;
  print_card_info king_hearts;
  print_card_info ten_diamonds;
  
  print_endline "\n# Testing comparison functions:";
  test_compare ace_spades king_hearts;
  test_compare ten_diamonds king_hearts;
  test_compare ten_diamonds ten_diamonds;
  test_max ace_spades king_hearts;
  test_min king_hearts ten_diamonds;
  test_min king_hearts king_hearts;
  
  print_endline "\n# Testing best function:";
  test_best [];
  test_best [ace_spades];
  test_best [ace_spades; king_hearts; ten_diamonds];
  
  print_endline "\n# Testing color predicates:";
  test_color_predicates ace_spades;
  test_color_predicates king_hearts;
  test_color_predicates ten_diamonds;
  
  print_endline "\n# Testing all cards of each color:";
  print_endline "Spades:";
  List.iter print_card_info Card.allSpades;
  print_endline "\nHearts:";
  List.iter print_card_info Card.allHearts;
  print_endline "\nDiamonds:";
  List.iter print_card_info Card.allDiamonds;
  print_endline "\nClubs:";
  List.iter print_card_info Card.allClubs

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt Card.ml main.ml -o card                                        *)
(* $ ./card                                                                   *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "Card.ml";;                                                         *)
(* # let ace_spades = Card.newCard Card.Value.As Card.Color.Spade;;            *)
(* val ace_spades : Card.t = Card {value = As; color = Spade}                  *)
(* # Card.toString ace_spades;;                                                *)
(* - : string = "AS"                                                         *)
(*                                                                            *)
(* ************************************************************************** *) 