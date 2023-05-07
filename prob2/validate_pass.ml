(* returns true iff c is uppercase *)
let is_upper (c : char) : bool =
  c >= 'A' && c <= 'Z'

(* returns true iff c is lowercase *)
let is_lower (c : char) : bool =
  c >= 'a' && c <= 'z'

(* returns true iff c is in s *)
let rec is_special_generic (s : char list) (c : char) : bool =
  match s with
  | [] -> false
  | hd :: tl -> if hd = c then true else is_special_generic tl c

(* list of special characters *)
let specials = ['!'; '@'; '#'; '$'; '%'; '&']
(* function that takes a char *)
let is_special = is_special_generic specials

(* returns true iff c is a number *)
let is_number (c : char) : bool =
  c >= '0' && c <= '9'

(* custom type for password tests *)
type password_test = PasswordTest of string * bool

(* given the password requirements returns true iff s meets the requirements *)
let validate_pass_generic (numbers : int) (upper : int) (special : int) (s : string) : bool =
  let upper_count = String.fold_left (fun a c -> if is_upper c then a + 1 else a) 0 s in
  let special_count = String.fold_left (fun a c -> if is_special c then a + 1 else a) 0 s in
  let number_count = String.fold_left (fun a c -> if is_number c then a + 1 else a) 0 s in
  let lower_count  = String.fold_left (fun a c -> if is_lower c then a + 1 else a) 0 s in
  let unsupported = (String.length s - (upper_count + special_count + lower_count + number_count)) <> 0 in
  number_count >= numbers && upper_count >= upper && special_count >= special && not unsupported

(* our requirements for a password *)
let required_numbers   = 1
let required_special   = 1
let required_uppercase = 1
(* function that takes a string to validate *)
let validate_pass = validate_pass_generic required_numbers required_uppercase required_special

(* given a list of tests, ensures they all pass *)
let rec test_passwords (tests : password_test list) : unit =
  match tests with
  | [] -> ()
  | PasswordTest (s, res) :: tl ->
    assert (validate_pass(s) = res);
    test_passwords tl

let run_tests () : unit =
  let test1 : password_test = PasswordTest ("IMeet3Requirements!", true) in
  let test2 : password_test = PasswordTest ("12345678", false) in
  let test3 = PasswordTest("abcdefghi", false) in
  let test4 = PasswordTest("ABCDEFG", false) in
  let test5 = PasswordTest("!@#$%&", false) in
  let test6 = PasswordTest("abcDEFG123", false) in
  let test7 = PasswordTest("abcDEF", false) in
  let test8 = PasswordTest("abc123", false) in
  let test9 = PasswordTest("abcDEF123$%)", false) in
  let password_tests = [test1; test2; test3; test4; test5; test6;
                          test7; test8; test9] in
  test_passwords password_tests


let _ = run_tests () ;;