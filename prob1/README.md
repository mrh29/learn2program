# Problem 1
In this directory, you should see a file named hello.ml. It currently prints "Hello, world. My name is Alice, and I am 42." and a message about the age of Alice. Your first task is to edit the program, so that it prints your name and age: "Hello, world. My name is Y, and I am Z." To do this you need to modify two things: the string 'Alice' and the number 42.

When completed, your file hello should print the above text when run.

### Strings and Numbers
In programming, a string is a sequence of characters (or chars) that represent text to the program. In OCaml, they are started and ended with a double quotation mark ("). The other type in this problem is a number or integer. This type represents a number which has multiple uses from arithmetic to counters.

### More on Types
You may be wondering what the benefit of types are. Types allow programmers to catch errors that could have derailed the program. Consider the basic example 2 + "Hello". Some languages will be able to detect a type error like this and inform the programmer before having to run the program. When working in a large codebase, typing can help you catch mistakes before they've been run.

### On Conditionals
Below the print statements (lines with Printf.printf), you'll notice a few blocks that start with if followed by a condition. This is your first exposure to a conditional statement. These are statements that are only run when certain conditions are met.

```
if foo then Printf.printf "%u\n" 1
else if bar then Printf.printf "%u\n" 2
else Printf.printf "%u\n" 3
```

In this example, if the condition foo is met we will print 1, if bar (but not foo) is met, we will print 2, and in all other cases we will print 3. In OCaml,
each conditional must have a then and else branch.

In hello.ml, a different statement is printed based on the age that you set before compiling your program. Try and change the age to print each statement!

### Comments
One important part of programming is adding documentation in the form of comments in your code. Comments are notes that do not
impact how your code is run, but make it easier for a human to read and understand what the code is doing. In OCaml,
comments are started with ```(*``` and ended with ```*)```. So you can have the comment ```(* my first comment *)```. Try adding
a comment to your code and verify it does not change how your program runs.