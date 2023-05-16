(* user's name *)
let name = "Alice" in
(* user's age *)
let age  = 42 in
(* Block comment:
    Comments can span multiple lines
    in OCaml, as long as it is between the parenthesis *)
let _ = Printf.printf "Hello, world. My name is %s, and I am %u\n" name age in
if age < 12 then (Printf.printf "You're a child\n")
else if age < 20 then (Printf.printf "You're a teen\n")
else if age < 30 then (Printf.printf "You're in your twenties\n")
else if age = 100 then (Printf.printf "You're a century old!\n")
else Printf.printf "You're older than 30\n"