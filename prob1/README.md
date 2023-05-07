# Problem 1
In this directory, you should see a file named hello. It currently prints "Hello, world. My name is Alice, and I am 42." and a message about the age of Alice. Your first task is to edit the program, so that it prints your name and age: "Hello, world. My name is Y, and I am Z." To do this you need to modify two things: the string 'Alice' and the number 42.

When completed, your file hello should print the above text when run.

### Strings and Numbers
In programming, a string is a sequence of characters (or chars) that represent text to the program. In Python, they are started and ended with a single or double quotation mark (' or "). We use single quotation mark throughout this problem for consistency. The other type in this problem is a number or integer. This type represents a number which has multiple uses from arithmetic to counters.

### More on Types
You may be wondering what the benefit of types are. Types allow programmers to catch errors that could have derailed the program. Consider the basic example 2 + "Hello". Some languages will be able to detect a type error like this and inform the programmer before having to run the program. Python will only detect this type of error
at runtime. When working in a large codebase, typing can help you catch mistakes before they've been run.

### On Conditionals
Below the print statements (lines with print), you'll notice a few blocks that start with if followed by a condition. This is your first exposure to a conditional statement. These are statements that are only run when certain conditions are met.

```
if foo:
    print('1')
elif bar:
    print('2')
else:
    print('3')
```

In this example, if the condition foo is met we will print 1, if bar (but not foo) is met, we will print 2, and in all other cases we will print 3. If foo is a number (type int), the statement in the block will be evaluated if it is non-zero. ```elif``` is a shortening of ```else if``` specific to python. Because else if statements are
so common in programming this shortening helps save typing.

In hello, a different statement is printed based on the age that you set before compiling your program. Try and change the age to print each statement!

### Comments
One important part of programming is adding documentation in the form of comments in your code. Comments are notes that do not impact how your code is run, but make it easier for a human to read and understand what the code is doing. In Python, there are two types of comments. Single line comments which start
with ```#``` and comment the rest of the line and comments started and ended with ```"""```. So you can have the comment ```# single line``` or
```"""Multi-line"""```. Try adding a comment to your code and verify it does not change how your program runs.