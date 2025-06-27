type 'a ft_ref = { mutable value: 'a }

let return x = { value = x }
let get r = r.value
let set r v = r.value <- v
let bind r f = f r.value

(* Test cases *)
let () =
  let r = return 42 in
  Printf.printf "Initial: %d\n" (get r);
  set r 100;
  Printf.printf "After set: %d\n" (get r);
  let r2 = bind r (fun x -> return (x + 1)) in
  Printf.printf "Bind result: %d\n" (get r2)

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt -o ft_ref ft_ref.ml                                             *)
(* $ ./ft_ref                                                                 *)
(*                                                                            *)
(* ************************************************************************** *) 