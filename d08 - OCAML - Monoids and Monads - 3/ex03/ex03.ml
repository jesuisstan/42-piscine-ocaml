module Try = struct
  type 'a t = Success of 'a | Failure of exn
  let return x = Success x
  let bind m f =
    match m with
    | Success v -> (try f v with e -> Failure e)
    | Failure e -> Failure e
  let recover m f =
    match m with
    | Success v -> Success v
    | Failure e -> (try f e with e2 -> Failure e2)
  let filter m pred =
    match m with
    | Success v -> (try if pred v then Success v else Failure (Failure "Predicate failed") with e -> Failure e)
    | Failure e -> Failure e
  let flatten m =
    match m with
    | Success (Success v) -> Success v
    | Success (Failure e) -> Failure e
    | Failure e -> Failure e
end

open Try

let () =
  let open Try in
  let safe_div x y =
    try return (x / y) with e -> Failure e
  in
  let r1 = bind (safe_div 10 2) (fun x -> return (x + 1)) in
  let r2 = bind (safe_div 10 0) (fun x -> return (x + 1)) in
  let r3 = recover r2 (fun _ -> return 42) in
  let r4 = filter r1 (fun x -> x > 5) in
  let r5 = flatten (Success (Success 99)) in
  let print = function Success v -> Printf.printf "Success: %d\n" v | Failure _ -> Printf.printf "Failure\n" in
  print r1; print r2; print r3; print r4; print r5

(* ************************************************************************** *)
(*                                                                            *)
(* Compilation and execution instructions:                                    *)
(*                                                                            *)
(* $ ocamlopt ex03.ml -o ex03                                                 *)
(* $ ./ex03                                                                  *)
(*                                                                            *)
(* Standard OCaml interpreter:                                                *)
(* $ ocaml                                                                     *)
(* # #use "ex03.ml";;                                                         *)
(* # open Try;;                                                                *)
(* # let safe_div x y = try return (x / y) with e -> Failure e;;                *)
(* val safe_div : int -> int -> int Try.t = <fun>                              *)
(* # let r1 = bind (safe_div 10 2) (fun x -> return (x + 1));;                  *)
(* val r1 : int Try.t = Success 6                                              *)
(* # let r2 = bind (safe_div 10 0) (fun x -> return (x + 1));;                  *)
(* val r2 : int Try.t = Failure Division_by_zero                               *)
(*                                                                            *)
(* ************************************************************************** *) 