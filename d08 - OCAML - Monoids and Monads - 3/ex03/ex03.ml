module Try = struct
  type 'a t = Success of 'a | Failure of exn
  let return (value : 'a) : 'a t = Success value
  let bind (monad : 'a t) (function_to_apply : 'a -> 'b t) : 'b t =
    match monad with
    | Success value -> (try function_to_apply value with e -> Failure e)
    | Failure e -> Failure e
  let recover (monad : 'a t) (recovery_function : exn -> 'a t) : 'a t =
    match monad with
    | Success value -> Success value
    | Failure e -> (try recovery_function e with e2 -> Failure e2)
  let filter (monad : 'a t) (predicate : 'a -> bool) : 'a t =
    match monad with
    | Success value -> (try if predicate value then Success value else Failure (Failure "Predicate failed") with e -> Failure e)
    | Failure e -> Failure e
  let flatten (nested_monad : 'a t t) : 'a t =
    match nested_monad with
    | Success (Success value) -> Success value
    | Success (Failure e) -> Failure e
    | Failure e -> Failure e
end

(* Test block *)
open Try

let () =
  let open Try in
  let safe_div (x : int) (y : int) : int t =
    try return (x / y) with e -> Failure e
  in

  let r1 = bind (safe_div 10 2) (fun x -> return (x + 1)) in
  let r2 = bind (safe_div 10 0) (fun x -> return (x + 1)) in
  let r3 = recover r2 (fun _ -> return 42) in
  let r4 = filter r1 (fun x -> x > 5) in
  let r5 = filter r1 (fun x -> x < 5) in
  let r6 = flatten (Success r1) in
  let r7 = flatten (Success r2) in

  let print = function Success v -> Printf.printf "Success: %d\n" v | Failure _ -> Printf.printf "Failure\n" in
  print r1; print r2; print r3; print r4; print r5; print r6; print r7