(* ************************************************************************** *)
(*                                                                            *)
(* Card.ml                                                                    *)
(* Exercise 02: Cards                                                         *)
(* Allowed functions: invalid_arg, Printf.sprintf and List module            *)
(*                                                                            *)
(* ************************************************************************** *)

module Color = struct
  type t = Spade | Heart | Diamond | Club

  let all = [Spade; Heart; Diamond; Club]

  let toString color = match color with
    | Spade -> "S" | Heart -> "H" | Diamond -> "D" | Club -> "C"

  let toStringVerbose color = match color with
    | Spade -> "Spade" | Heart -> "Heart"
    | Diamond -> "Diamond" | Club -> "Club"
end

module Value = struct
  type t = T2 | T3 | T4 | T5 | T6 | T7 | T8 | T9 | T10 | Jack | Queen | King | As

  let all = [T2; T3; T4; T5; T6; T7; T8; T9; T10; Jack; Queen; King; As]

  let toInt value = match value with
    | T2 -> 1  | T3 -> 2  | T4 -> 3  | T5 -> 4  | T6 -> 5  | T7 -> 6  | T8 -> 7
    | T9 -> 8  | T10 -> 9 | Jack -> 10 | Queen -> 11 | King -> 12 | As -> 13

  let toString value = match value with
    | T2 -> "2"  | T3 -> "3"  | T4 -> "4"  | T5 -> "5"  | T6 -> "6"
    | T7 -> "7"  | T8 -> "8"  | T9 -> "9"  | T10 -> "10"
    | Jack -> "J" | Queen -> "Q" | King -> "K" | As -> "A"

  let toStringVerbose value = match value with
    | T2 -> "2"  | T3 -> "3"  | T4 -> "4"  | T5 -> "5"  | T6 -> "6"
    | T7 -> "7"  | T8 -> "8"  | T9 -> "9"  | T10 -> "10"
    | Jack -> "Jack" | Queen -> "Queen" | King -> "King" | As -> "As"

  let next value = match value with
    | T2 -> T3  | T3 -> T4  | T4 -> T5  | T5 -> T6  | T6 -> T7
    | T7 -> T8  | T8 -> T9  | T9 -> T10 | T10 -> Jack
    | Jack -> Queen | Queen -> King | King -> As
    | As -> invalid_arg "Value.next: As has no next value"

  let previous value = match value with
    | As -> King | King -> Queen | Queen -> Jack | Jack -> T10
    | T10 -> T9 | T9 -> T8 | T8 -> T7 | T7 -> T6 | T6 -> T5
    | T5 -> T4  | T4 -> T3 | T3 -> T2
    | T2 -> invalid_arg "Value.previous: T2 has no previous value"
end

type t = { value : Value.t; color : Color.t }

let newCard v c = { value = v; color = c }

let allSpades = List.map (fun v -> newCard v Color.Spade) Value.all
let allHearts = List.map (fun v -> newCard v Color.Heart) Value.all
let allDiamonds = List.map (fun v -> newCard v Color.Diamond) Value.all
let allClubs = List.map (fun v -> newCard v Color.Club) Value.all
let all = List.append (List.append allSpades allHearts) (List.append allDiamonds allClubs)

let getValue card = card.value
let getColor card = card.color

let toString card = 
  Value.toString card.value ^ Color.toString card.color

let toStringVerbose card =
  Printf.sprintf "Card(%s, %s)" 
    (Value.toStringVerbose card.value) 
    (Color.toStringVerbose card.color)

let compare c1 c2 =
  match Value.toInt c1.value - Value.toInt c2.value with
  | 0 -> Stdlib.compare (Color.toString c1.color) (Color.toString c2.color)
  | n -> n

let max c1 c2 = if compare c1 c2 >= 0 then c1 else c2
let min c1 c2 = if compare c1 c2 <= 0 then c1 else c2

let best cards = match cards with
  | [] -> invalid_arg "Card.best: empty list"
  | cards -> List.fold_left max (List.hd cards) (List.tl cards)

let isOf card color = card.color = color
let isSpade card = isOf card Color.Spade
let isHeart card = isOf card Color.Heart
let isDiamond card = isOf card Color.Diamond
let isClub card = isOf card Color.Club 