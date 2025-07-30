(* Atom classes for ex00 *)

class virtual atom (name_init:string) (symbol_init:string) (atomic_number_init:int) = object (self)
  method virtual name : string
  method virtual symbol : string
  method virtual atomic_number : int
  method to_string =
    Printf.sprintf "<atom: name=%s, symbol=%s, atomic_number=%d>" self#name self#symbol self#atomic_number
  method equals (other : atom) =
    self#name = other#name && self#symbol = other#symbol && self#atomic_number = other#atomic_number
end

class hydrogen = object
  inherit atom "Hydrogen" "H" 1
  method name = "Hydrogen"
  method symbol = "H"
  method atomic_number = 1
end

class carbon = object
  inherit atom "Carbon" "C" 6
  method name = "Carbon"
  method symbol = "C"
  method atomic_number = 6
end

class oxygen = object
  inherit atom "Oxygen" "O" 8
  method name = "Oxygen"
  method symbol = "O"
  method atomic_number = 8
end

class nitrogen = object
  inherit atom "Nitrogen" "N" 7
  method name = "Nitrogen"
  method symbol = "N"
  method atomic_number = 7
end

class sodium = object
  inherit atom "Sodium" "Na" 11
  method name = "Sodium"
  method symbol = "Na"
  method atomic_number = 11
end

class chlorine = object
  inherit atom "Chlorine" "Cl" 17
  method name = "Chlorine"
  method symbol = "Cl"
  method atomic_number = 17
end 