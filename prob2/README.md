# Problem 2
In this directory, you should see a file named validate_pass.c.
If you make the program using the Makefile and run the resulting ```validate_pass```,
you will see the message "Assertion failed:" followed by information about the assertion.
Your task is to edit the program, so that it 
1. Validates a password given some requirements
2. Passes all of the Provided Unit Tests
3. Passes at least one Unit Test you added

To do this you need to modify the functions ```is_lower```, ```is_special```, ```is_number```,
and ```validate_password```, 
and the ```password_tests``` array.

### Macros
In C, macros are ways to define values in a way that makes them easier to change
later on. We define the macros ```REQUIRED_UPPER_CASE```, ```REQUIRED_NUMBERS```,
and ```REQUIRED_SPECIAL``` at the top of the C file as our password requirements.
We can then use these macro definitions rather than the number throughout the program.
This means that if later on we decide we want to require more numbers in the password,
we only need to change the defined macro without having to worry about where we
may have hardcoded a requirement number. The syntax for a macro is:
```#define macro_name value``` where ```macro_name``` is the name to use in your
program and ```value``` is the value the compiler will substitute for name. Keep in
mind that the compiler is limited in how it can substitute, so it's best to
keep macros simple.

### Functions
In programming, functions are sections of code that are separated out and then
called (i.e. used) in a different place. This is useful to keep code readable and
modular. For example, in validate_pass.c, rather than writing the checks for
a character directly in the function ```validate_pass``` (which is called inlining),
the logic for each type of character is broken out into a function to make it clear
what is being checked in each conditional. While not demonstrated in this example,
functions are also helpful if you want to reuse code multiple times without having
to rewrite or copy-paste the code every time you use it.

### Arrays
We introduce the new array type in this problem. Arrays are a list or grouping of
a particular type.
Arrays are declared (or created) with the following syntax:
```type array_name[size];```. ```type``` is the type of each
element of the array. It is any previously declared C type. ```array_name``` is the
name by which you will reference the array. It can be any valid C identifier. ```size```
is how many elements will be in the array. If you declare an array like this,
it will have garbage values in it, so make sure to set the values before using them!

The declaration of one array is at line 14 of the program:
```char special[NUM_SPECIAL] = {'!', '@', '#', '$', '%', '&'};```. This is the initializer
list method of creating an array in C. In it, you tell the compiler how long the array
is and with what values it should start. This avoids the problem of having garbage in
your array when it is initialized. This is an array named ```special```
of size ```NUM_SPECIAL``` which contains ```char``` elements.

### Boolean Logic
Boolean logic is used throughout programming. It is used for deciding if something
falls into two categories: true or false. It is mostly used for conditional statements, but
it can also be used for loops and other logic. There are a few boolean operators on numbers:
```<```, ```>```, ```>=```, ```<=```, ```==```, and ```!=```. These are
less than, greater than, greater than or equal, less than or equal, equal, and not equal.
A common way of describing boolean logic is using truth tables. A truth table
describes the value of the inputs and the resulting output for different operators.
Here is a truth table for different values and operators (we use 1 for true and 0 for false):

| a    | b    | a < b | a > b | a >= b | a <= b | a == b | a != b |
| ---- | ---- | ----- | ----- | ------ | ------ | ------ | ------ |
| 0    | 0    | 0     |   0   |   1    |    1   |    1   |   0    |
| 0    | 1    | 1     |   0   |   0    |    1   |    0   |   1    |
| 9    | 5    | 0     |   1   |   1    |    0   |    0   |   1    |

There are also the operators ```&&``` (and) and ```||``` (or). These operators
allow you to combine multiple Boolean logic expressions. For example,
```a > b || b > c``` evaluates to true if ```a > b``` OR ```b > c``` and
```a > b || b > c``` evaluates to true if ```a > b``` AND ```b > c```. This
can be useful for checking multiple conditions are met. You will need
to use one of these operators to fix the logic in the ```validate_password```
function to correctly check all the chracter requirements.

### Loops
In programming, loops are a construct that allow us to repeat code some number of
times. In this problem, we use a loop to iterate over the ```password_tests``` array
and validate that each of the tests passes our cases. A loop will repeat any code
inside its braces until a certain condition is met. Loops in C are in two forms:
for loops and while loops. for loops are typically used when a known number of iterations
is being used: in this case the number of tests we have to check. The structure is:
```for (initialization; condition; post-operation)```. ```initialization``` is any variables
you want to set up specifically for the loop. Typically, this is a counter
that counts the number of times the loops has been iterated already. In this problem,
we set up an integer i starting at 0. ```condition``` is the
condition (Boolean logic) that tracks when the loop should end. When this condition
becomes false, the loop will stop iterating, and code execution will continue outside
of the loop. In this problem, we will iterate until ```i == NUM_TESTS``` at which point we
will exit the loop. This means that we will iterate ```NUM_TESTS``` times. On each iteration
of the loop, we check a different password_test in the ```password_tests``` array. You will
need to add a loop to implement the ```is_special``` function.

### Unit Tests
Unit tests are a standard way of validating that the code you have written is correct.
Each test is run on your code and compared with an expected outcome. If the result
of your code matches the expected outcome, then it is likely your code is correct. It is
good practice to have lots of tests to make sure that every possible case is
accounted for (or covered). Having good code coverage allows you to have confidence that
your code is running as intended. 

For this problem, we define a simple struct type (more on that later)
that has a password, length, and the intended result of the password. We iterate over an array in
a loop and assert that the result of the function call matches the expected result. An assert is a
way to ensure that certain conditions are met by your program. You pass a boolean expression to
the ```assert``` function; if it evaluates to true, the program continues and you
know that the condition was true otherwise the program immediately stops executing.
You should add a case or two to the tests and make sure that it does not assert. Make sure you modify a certain
macro so that your tests are actually run in the loop.