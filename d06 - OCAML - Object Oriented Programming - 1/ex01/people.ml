class people (name_init:string) = object
  val name : string = name_init
  val hp : int = 100
  method to_string = Printf.sprintf "<people: name=%s, hp=%d>" name hp
  method talk = Printf.printf "I'm %s! Do you know the Doctor?\n" name
  method die = print_endline "Aaaarghh!"
  initializer print_endline ("A new person named " ^ name ^ " has been created!")
end 