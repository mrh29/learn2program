# Problem 2
In this directory, you should see a file named validate_pass.ml.
If you make the program using the Makefile and run the resulting ```validate_pass.byte```,
you will see the message "Fatal error: exception Assert_failure" followed by information about the assertion.
Your task is to edit the program, so that it 
1. Validates a password given some requirements
2. Passes all of the Provided Unit Tests
3. Passes at least one Unit Test you added

To do this you need to modify the functions ```is_lower```, ```is_number```,
and ```validate_password```, 
and the ```password_tests``` array.

### Functions
In programming, functions are sections of code that are separated out and then
called (i.e. used) in a different place. This is useful to keep code readable and
modular. For example, in validate_pass.ml, rather than writing the checks for
a character directly in the function ```validate_pass``` (which is called inlining),
the logic for each type of character is broken out into a function to make it clear
what is being checked in each conditional. While not demonstrated in this example,
functions are also helpful if you want to reuse code multiple times without having
to rewrite or copy-paste the code every time you use it.

In OCaml, the syntax for declaring a function is the following:

```let [rec] function_name (arg1 [: type1]) (arg2 [: type2]) [: result_type]```.

```result_type``` is the return type of the function. This can be any OCaml type previously
declared or ```unit``` which is a special type in OCaml that only has the vaue (). ```function_name```
is the name used to call a function later on in the code. ```arg1: type1``` is the the type
and name of the various arguments. An argument is passed (or given) to the function to
be used in the function code. They can be of any type and you can have any number
of arguments to a function. Anything in brackets is optional. While you don't have to provide
the types of the arguments or the return type, it is good practice to specify the type to make
understanding the function easier. The optional ```rec``` is for recursive functions. A recursive
function is one that can call itself inside its definition. Take a look at ```is_special_generic```
for an example of a recursive function in OCaml. Recursive functions are used quite often in OCaml
rather than loops. See the next section for more information about recursion.

### Recursion
In programming, recursion are a construct that allow us to repeat code some number of
times. Rather than looping (see Python or C branches), recursion makes use of repeated
function calls to the same function. Recursion relies on two cases: base cases and recursive cases. A base case is
one that does not call the function again. A recursive case will call the function
again (hopefully with different arguments). A classic example of recursion is factorial:

```let rec fact (n : int) : int =
        if n <= then 1
        else n * fact (n - 1)
```

First, note that this function does not work for negative numbers. The base
case here is when ```n <= 1```. The function returns 1. The recursive case
is the other one which will multiple ```n``` by the result of calling
fact on ```n - 1```. Let's look at a trace of calling this on 5.

```
    fact 5 (* 5 is not lte 1 *)
    5 * fact 4 (* 4 is not lte 1 *)
    5 * 4 * fact 3 (* 3 is not lte 1 *)
    5 * 4 * 3 * fact 2 (* 2 is not lte 1 *)
    5 * 4 * 3 * 2 * fact 1 (* fact 1 is a base case *)
    5 * 4 * 3 * 2 * 1
    = 120
```

Recursion is also used to process lists as lists are recursively defined with
a base and recursive case.

### List
We introduce the new list type in this problem. Lists are a grouping of
a particular type.
Lists are declared (or created) with the following syntax:
```let l = [x; y; z]```. ```x```, ```y```, and ```z``` must be the same
type for this to be a valid list. We say that ```l``` has type ```'a list``` where
```'a``` is the type of each element. For example, ```[1; 2; 3;]``` is type ```int list```.

To access the element of a list in OCaml, you typically use recursion. In most languages,
indexes start at 0, so ```speical[0]``` is the character ```!``` and
so on for the rest of the indices. An out-of-bounds index is one that
is larger than the size of the array. For example,
```special[NUM_SPECAL]``` is an out-of-bounds access. In C, these
can be especially dangerous because the code can compile (often with warnings),
but will still run. In the worst case, an error like this could be exploited
by a threat actor and cause security issues or data breaches.

### Boolean Logic
Boolean logic is used throughout programming. It is used for deciding if something
falls into two categories: true or false. It is mostly used for conditional statements, but
it can also be used for loops and other logic. There are a few boolean operators on numbers:
```<```, ```>```, ```>=```, ```<=```, ```=```, and ```<>```. These are
less than, greater than, greater than or equal, less than or equal, equal, and not equal.
A common way of describing boolean logic is using truth tables. A truth table
describes the value of the inputs and the resulting output for different operators.
Here is a truth table for different values and operators (we use 1 for true and 0 for false):

| a    | b    | a < b | a > b | a >= b | a <= b | a = b  | a <> b |
| ---- | ---- | ----- | ----- | ------ | ------ | ------ | ------ |
| 0    | 0    | false | false | true   | true   | true   | false  |
| 0    | 1    | true  | false | false  | true   | false  | true   |
| 9    | 5    | false | true  | true   | false  | false  | true   |

There are also the operators ```&&``` (and) and ```||``` (or). These operators
allow you to combine multiple Boolean logic expressions. For example,
```a > b || b > c``` evaluates to true if ```a > b``` OR ```b > c``` and
```a > b || b > c``` evaluates to true if ```a > b``` AND ```b > c```. This
can be useful for checking multiple conditions are met. You will need
to use one of these operators to fix the logic in the ```validate_password```
function to correctly check all the chracter requirements.

### Unit Tests
Unit tests are a standard way of validating that the code you have written is correct.
Each test is run on your code and compared with an expected outcome. If the result
of your code matches the expected outcome, then it is likely your code is correct. It is
good practice to have lots of tests to make sure that every possible case is
accounted for (or covered). Having good code coverage allows you to have confidence that
your code is running as intended. 

For this problem, we define a simple type (more on that later)
that has a password and the intended result of the password. We pass a list of these tests
to a function that asserts if the result of the function call matches the expected result. An assert is a
way to ensure that certain conditions are met by your program. You pass a boolean expression to
the ```assert``` function; if it evaluates to true, the program continues and you
know that the condition was true otherwise the program immediately stops executing.
You should add a case or two to the tests and make sure that it does not assert.