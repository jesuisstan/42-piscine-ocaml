(* ************************************************************************** *)
(*                                                                            *)
(*                               d06 - ex02                                   *)
(*                                                                            *)
(*   Class: doctor (for ex02)                                                 *)
(*                                                                            *)
(* ************************************************************************** *)

class doctor (name_init:string) (age_init:int) (sidekick:People.people) = object
  val name : string = name_init
  val age : int = age_init
  val sidekick : People.people = sidekick
  val hp : int = 100
  method to_string = Printf.sprintf "<doctor: name=%s, age=%d, hp=%d, sidekick=%s>" name age hp (sidekick#to_string)
  method talk = print_endline "Hi! I'm the Doctor!"
  initializer print_endline ("A new Doctor named " ^ name ^ " has been created!")
end 