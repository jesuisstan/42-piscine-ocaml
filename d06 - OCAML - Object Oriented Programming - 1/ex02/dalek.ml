Random.self_init ()

class dalek = object
  val name : string = 
    let chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" in
    let random_char () = chars.[Random.int (String.length chars)] in
    "Dalek" ^ String.make 3 (random_char ())
  val mutable shield : bool = true
  val hp : int = 100
  method to_string = Printf.sprintf "<dalek: name=%s, hp=%d, shield=%b>" name hp shield
  method talk = 
    let phrases = [
      "Explain! Explain!";
      "Exterminate! Exterminate!";
      "I obey!";
      "You are the Doctor! You are the enemy of the Daleks!"
    ] in
    print_endline (List.nth phrases (Random.int (List.length phrases)))
  method exterminate (p:People.people) = 
    shield <- not shield;
    p#die
  method die = print_endline "Emergency Temporal Shift!"
  initializer 
    print_endline ("A new Dalek named " ^ name ^ " has been created!")
end 