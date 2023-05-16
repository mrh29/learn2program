(* returns true iff c is uppercase *)
  let is_upper (c : char) : bool =
    c >= 'A' && c <= 'Z'
  
  (* returns true iff c is lowercase *)
  let is_lower (c : char) : bool =
    false
  
  (* returns true iff c is in s *)
  let rec is_special_generic (s : char list) (c : char) : bool =
    match s with
    | [] -> false
    | hd :: tl -> 
      if hd = c then true 
      else (* TODO: recursively call is_special_generic on the rest of the list *) false
  
  (* list of special characters *)
  let specials = ['!'; '@'; '#'; '$'; '%'; '&']
  (* function that takes a char *)
  let is_special = is_special_generic specials
  
  (* returns true iff c is a number *)
  let is_number (c : char) : bool =
    false
  
  (* custom type for password tests *)
  type password_test = PasswordTest of string * bool
  
  (* given the password requirements returns true iff s meets the requirements *)
  let validate_pass_generic (numbers : int) (upper : int) (special : int) (s : string) : bool =
    let upper_count = String.fold_left (fun a c -> if is_upper c then a + 1 else a) 0 s in
    let special_count = String.fold_left (fun a c -> if is_special c then a + 1 else a) 0 s in
    let number_count = String.fold_left (fun a c -> if is_number c then a + 1 else a) 0 s in
    let lower_count  = String.fold_left (fun a c -> if is_lower c then a + 1 else a) 0 s in
    let unsupported = (String.length s - (upper_count + special_count + lower_count + number_count)) <> 0 in
    (* TODO: check uppercase and special *)
    number_count >= numbers && not unsupported
  
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
    (* TODO: add additional test cases *)
    let password_tests = [test1; test2] in
    test_passwords password_tests
  
  
  let _ = run_tests () ;;