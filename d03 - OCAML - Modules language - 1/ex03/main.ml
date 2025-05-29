(* ************************************************************************** *)
(*                                                                            *)
(* main.ml                                                                    *)
(* Exercise 03: Deck                                                          *)
(* Tests for Deck module                                                     *)
(*                                                                            *)
(* ************************************************************************** *)

let print_deck_info deck =
  print_endline "Short representation:";
  List.iter (fun s -> print_string (s ^ " ")) (Deck.toStringList deck);
  print_endline "\n\nVerbose representation:";
  List.iter (fun s -> print_endline s) (Deck.toStringListVerbose deck)

let test_draw_cards deck n =
  let rec draw_n n deck =
    if n <= 0 then []
    else match deck with
      | [] -> []
      | _ ->
          let (card, rest) = Deck.drawCard deck in
          card :: draw_n (n - 1) rest
  in
  let drawn = draw_n n deck in
  Printf.printf "\nDrawn %d cards:\n" n;
  List.iter (fun card -> print_endline (Deck.Card.toStringVerbose card)) drawn

let main () =
  print_endline "# Testing Deck module:";
  
  print_endline "\n# Creating a new deck:";
  let deck = Deck.newDeck () in
  print_deck_info deck;
  
  print_endline "\n# Testing card drawing:";
  test_draw_cards deck 5;
  
  print_endline "\n# Testing empty deck:";
  let empty_deck = [] in
  try
    let _ = Deck.drawCard empty_deck in
    print_endline "Error: should have raised Failure"
  with Failure msg -> print_endline ("Expected error: " ^ msg);
  
  print_endline "\n# Creating and displaying another deck to demonstrate randomness:";
  let another_deck = Deck.newDeck () in
  print_deck_info another_deck

let () = main ()

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt Deck.mli Deck.ml main.ml -o deck                               *)
(* $ ./deck                                                                   *)
(*                                                                            *)
(* ************************************************************************** *) 