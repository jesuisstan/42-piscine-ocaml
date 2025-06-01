(* Simple test script for ft_test_sign *)

let ft_test_sign n =
  if n >= 0 then
    print_endline "positive"
  else
    print_endline "negative"

(* Test with command line arguments *)
let () =
  if Array.length Sys.argv < 2 then begin
    print_endline "Usage: ./test_sign <number>";
    print_endline "Example: ./test_sign 42";
    print_endline "Example: ./test_sign -5"
  end else begin
    let n = int_of_string Sys.argv.(1) in
    ft_test_sign n
  end 