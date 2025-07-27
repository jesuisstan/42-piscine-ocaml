type 'a ft_ref = { mutable value: 'a }

let return : 'a -> 'a ft_ref = fun x -> { value = x }
let get : 'a ft_ref -> 'a = fun r -> r.value
let set : 'a ft_ref -> 'a -> unit = fun r v -> r.value <- v
let bind : 'a ft_ref -> ('a -> 'b ft_ref) -> 'b ft_ref = fun r f -> f r.value

(* Test cases *)
let () =
  let r = return 42 in
  Printf.printf "Initial: %d\n" (get r);
  set r 100;
  Printf.printf "After set: %d\n" (get r);
  let r2 = bind r (fun x -> return (x + 1)) in
  Printf.printf "Bind result: %d\n" (get r2);
  Printf.printf "Original ref still: %d\n" (get r)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o ft_ref ft_ref.ml                                             *)
(* $ ./ft_ref                                                                 *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ft_ref.ml";;                                                       *)
(* # let r = return 42;;                                                        *)
(* val r : int ft_ref = {value = 42}                                           *)
(* # get r;;                                                                    *)
(* - : int = 42                                                                *)
(*                                                                            *)
(* ************************************************************************** *) 