# Problem 2
In this directory, you should see a file named validate_pass.
If you run the program,
you will see the message "AssertionError".
Your task is to edit the program, so that it 
1. Validates a password given some requirements
2. Passes all of the Provided Unit Tests
3. Passes at least one Unit Test you added

To do this you need to modify the functions ```is_lower```, ```is_special```, ```is_number```,
and ```validate_password```, 
and the ```password_tests``` array.

There are TODO comments where changes are needed.

### Global Variables
In Python, global variables (or globals) are ways to define values in a way that makes them easier to change
later on. These are variables that are defined at the top of the program
and can be used by any part (or any function) of the code. Typically,
they are defined with all uppercase letters, but this is not a requirement.
We define the globals  ```REQUIRED_UPPER_CASE```, ```REQUIRED_NUMBERS```,
and ```REQUIRED_SPECIAL``` at the top of the file as our password requirements.
We can then use these globals rather than the number throughout the program.
This means that if later on we decide we want to require more numbers in the password,
we only need to change the defined macro without having to worry about where we
may have hardcoded a requirement number. The syntax for defining a global is the
same as any other variable.

### Functions
In programming, functions are sections of code that are separated out and then
called (i.e. used) in a different place. This is useful to keep code readable and
modular. For example, in validate_pass, rather than writing the checks for
a character directly in the function ```validate_pass``` (which is called inlining),
the logic for each type of character is broken out into a function to make it clear
what is being checked in each conditional. While not demonstrated in this example,
functions are also helpful if you want to reuse code multiple times without having
to rewrite or copy-paste the code every time you use it. In python you define a function
using the following syntax: ```def f(arg1, arg2, ...):```. ```f``` is the name
of the function you are defining. It is how you later call the function in 
a separate place in the code. ```argn``` is an argument to the function. It is
passed (or given) to the function to operate on. You can have any number of arguments
for a function depending on what your function does and you can change
the arguments each time you call the function

### Lists
We introduce the new list type in this problem. Lists are a grouping of
a particular type.
Lists are declared (or created) with the following syntax:
```l = [obj1, obj2, obj3]```. ```l``` is the
name by which you will reference the list. It can be any valid Python identifier.
```obj1, obj2, obj3``` are the elements of the list. In Python, these do not have
to be the same type, so it is valid to have the list ```l = [1, 'foo', 3.1415]```.

You can access each element of the list by its index. In most languages,
indexing starts at 0, so using the previous list, ```l[0]``` would be ```1```,
```l[1]``` would be ```'foo'``` and so on. Python also has a special negative
index so ```l[-1]``` is the end of the list (3.1415). Python also allows you
to add to a list using the ```append``` operation. For example,
```l.append(5)``` will add 5 to the end of the list.

### Boolean Logic
Boolean logic is used throughout programming. It is used for deciding if something
falls into two categories: true or false. It is mostly used for conditional statements, but
it can also be used for loops and other logic. There are a few boolean operators on numbers:
```<```, ```>```, ```>=```, ```<=```, ```==```, and ```!=```. These are
less than, greater than, greater than or equal, less than or equal, equal, and not equal.
A common way of describing boolean logic is using truth tables. A truth table
describes the value of the inputs and the resulting output for different operators.
Here is a truth table for different values and operators (python uses True for true and False for false):

| a    | b    | a < b | a > b | a >= b | a <= b | a == b | a != b |
| ---- | ---- | ----- | ----- | ------ | ------ | ------ | ------ |
| 0    | 0    | False | False |   True | True   | True   | False  |
| 0    | 1    | True  | False |  False | False  | False  | True   |
| 9    | 5    | False |  True |   True | False  | False  | True   |

There are also the operators ```and``` and ```or```. These operators
allow you to combine multiple Boolean logic expressions. For example,
```a > b or b > c``` evaluates to true if ```a > b``` OR ```b > c``` and
```a > b and b > c``` evaluates to true if ```a > b``` AND ```b > c```. This
can be useful for checking multiple conditions are met. You will need
to use one of these operators to fix the logic in the ```validate_password```
function to correctly check all the chracter requirements.

### ASCII

ASCII (American Standard Code for Information Interchange) is a format for characters used in programming. Each character is assigned an associated number that is used by the computer to store the character. For example, ```'A'``` has the value 65 and ```'z'``` has the value 122. We can make use of these values to check for certain qualities of a character (uppercase, lowercase, number) based on the range. In Python, you can make use of this character without having to know the ASCII value. For example, in is_upper we write ```('A' <= c) and (c <= 'Z')``` to check that the character is between uppercase A and uppercase Z inclusive. This is also more readable than ```c >= 65``` && ```c <= 90```. Python always has the built-in functions ```ord(c)``` and ```chr(n)``` which give the ASCII value of a character or the character
with ASCII value ```n``` respectively.

### Loops
In programming, loops are a construct that allow us to repeat code some number of
times. In this problem, we use a loop to iterate over the ```password_tests``` list
and validate that each of the tests passes our cases. A loop will repeat any code
inside its braces until a certain condition is met. Loops in python are in two forms:
for loops and while loops. for loops are typically 
used when a known number of iterations
is being used, for example if you want to run code 10 times. For loops are often used
when you want to iterate over each item in a group (like a list).
In this case, each of the tests in our list. The structure is:
```for item in iterable:```. ```item``` is a variable
you want to set up specifically for the loop. In this problem,
we call it test. ```iterable``` is the
grouping of objects we want to perform an action on. It is common to use
the ```range``` function to iterate a certain number of times. e.g.
```for i in range(10):``` will iterate with i in the range [0,9].

while loops are run until a certain condition is no longer true.
The syntax is ```while condition:```. As long as the Boolean expression
condition evaluates to True, the loop will execute.

### Unit Tests
Unit tests are a standard way of validating that the code you have written is correct.
Each test is run on your code and compared with an expected outcome. If the result
of your code matches the expected outcome, then it is likely your code is correct. It is
good practice to have lots of tests to make sure that every possible case is
accounted for (or covered). Having good code coverage allows you to have confidence that
your code is running as intended. 

For this problem, we define a simple cass (more on that later)
that has a password, length, and the intended result of the password. We iterate over a list in
a loop and assert that the result of the function call matches the expected result. An assert is a
way to ensure that certain conditions are met by your program. You pass a boolean expression to
the ```assert``` function; if it evaluates to True, the program continues and you
know that the condition was true otherwise the program immediately stops executing.
You should add a case or two to the tests and make sure that it does not assert.