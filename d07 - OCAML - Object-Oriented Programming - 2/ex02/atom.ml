(* Atom classes for ex00 *)

class virtual atom (name_init:string) (symbol_init:string) (atomic_number_init:int) = object (self)
  val name_val : string = name_init
  val symbol_val : string = symbol_init
  val atomic_number_val : int = atomic_number_init
  
  method virtual name : string
  method virtual symbol : string
  method virtual atomic_number : int
  method to_string : string = 
    Printf.sprintf "<atom: name=%s, symbol=%s, atomic_number=%d>" self#name self#symbol self#atomic_number
  method equals : atom -> bool = fun (other : atom) ->
    self#name = other#name && self#symbol = other#symbol && self#atomic_number = other#atomic_number
end

class hydrogen = object
  inherit atom "Hydrogen" "H" 1
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

class carbon = object
  inherit atom "Carbon" "C" 6
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

class oxygen = object
  inherit atom "Oxygen" "O" 8
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

class nitrogen = object
  inherit atom "Nitrogen" "N" 7
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

class sodium = object
  inherit atom "Sodium" "Na" 11
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

class chlorine = object
  inherit atom "Chlorine" "Cl" 17
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

(* Bonus atoms - 5 additional real atoms *)
class phosphorus = object
  inherit atom "Phosphorus" "P" 15
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

class sulfur = object
  inherit atom "Sulfur" "S" 16
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

class potassium = object
  inherit atom "Potassium" "K" 19
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

class calcium = object
  inherit atom "Calcium" "Ca" 20
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end

class iron = object
  inherit atom "Iron" "Fe" 26
  method name : string = name_val
  method symbol : string = symbol_val
  method atomic_number : int = atomic_number_val
end 