(* ************************************************************************** *)
(*                                                                            *)
(*                               d06 - ex02                                   *)
(*                                                                            *)
(*   Class: dalek                                                             *)
(*                                                                            *)
(* ************************************************************************** *)

class dalek (name_init:string) = object
  val name : string = name_init
  val mutable shield : bool = true
  val hp : int = 100
  method to_string = Printf.sprintf "<dalek: name=%s, hp=%d, shield=%b>" name hp shield
  method talk = print_endline "Exterminate! Exterminate!"
  method exterminate (p:People.people) = p#die
  method die = print_endline "Emergency Temporal Shift!"
  initializer print_endline ("A new Dalek named " ^ name ^ " has been created!")
end 