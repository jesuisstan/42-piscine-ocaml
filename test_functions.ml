(* Example: Just the functions without test code *)

let ft_power base exponent =
  let rec power_aux base exp =
    if exp = 0 then 1
    else if base = 0 then 0
    else base * power_aux base (exp - 1)
  in
  power_aux base exponent

let ft_test_sign n =
  if n >= 0 then
    print_endline "positive"
  else
    print_endline "negative"

let rec ft_countdown n =
  if n < 0 then
    (print_int 0; print_char '\n')
  else begin
    print_int n;
    print_char '\n';
    if n > 0 then ft_countdown (n - 1)
  end 