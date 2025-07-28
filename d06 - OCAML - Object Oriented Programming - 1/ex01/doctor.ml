class doctor (name_init:string) (age_init:int) (sidekick:People.people) = object
  val name : string = name_init
  val age : int = age_init
  val sidekick : People.people = sidekick
  val hp : int = 100
  method to_string = Printf.sprintf "<doctor: name=%s, age=%d, hp=%d, sidekick=%s>" name age hp (sidekick#to_string)
  method talk = print_endline "Hi! I'm the Doctor!"
  method travel_in_time (start:int) (arrival:int) = 
    print_endline "    ____";
    print_endline "   /    \\";
    print_endline "  /______\\";
    print_endline " | POLICE|";
    print_endline " |  BOX  |";
    print_endline " |_______|";
    print_endline "  |     |";
    print_endline "  |     |";
    print_endline "  |_____|"
  method use_sonic_screwdriver = print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"
  method private regenerate = {< hp = 100 >}
  initializer print_endline ("A new Doctor named " ^ name ^ " has been created!")
end 