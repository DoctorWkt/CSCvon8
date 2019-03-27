# CSCvon8 Compiler Details

This is the documentation for the *clc* compiler, which takes a sort of
high level language and converts it into the assembly language understood
by the *cas* assembler. An example usage is

```
./clc Examples/himinsky.cl
./cas Examples/himinsky.s
```

and ```Examples/himinsky.cl``` is an example program written in the high-level
language.

This document covers the *clc* compiler as it existed on March 16, 2019.

## Input Structure

First and foremost, you need to realise that *clc* is not a well-written
robust compiler, so the input that it can recognise is very particular.

*clc* parses one line at a time: there is no tokenisation. Whitespace is
generally ignored, and the compiler supports C-style // comment lines.

In the following, *italics* represent an abstraction which you need to
replace with something concrete.

## Variable Declaration.

Variables in the language are 8-bit and signed. To declare a variable,
use the syntax:

> var *name*;

Technically, *name* can be any non-whitespace characters, but I would
stick with the C-style variable naming conventions. Example:

```
  var x;
  var y;
  var i;
  var tmp;
```

## Expressions and Variable Assignment

The language only supports one operator on the right-hand side of an
assignment operation. Here is the available syntax:

<blockquote>
<i>name</i>= <i>name2</i>;<br>
<i>name</i>= <i>constant</i>;<br>
<i>name</i>= <i>constant</i> <i>op</i> <i>constant</i>;<br>
<i>name</i>= <i>name2</i> <i>op</i> <i>constant</i>;<br>
<i>name</i>= <i>constant</i> <i>op</i> <i>name2</i>;<br>
<i>name</i>= <i>name2</i> <i>op</i> <i>name3</i>;
</blockquote>

where the names are variables names and the constants are decimal constants;
The available operators are ```+```, ```-```, ```&```, ```|``` and ```^```
and are the same as the C operators. There are no multiply or divide operators. Not yet, anyway. The CSCvon8 architecture supports quite a lot of operators, but I haven't added them all to the *clc* compiler yet.

## Arithmetic Right Shift Operation

Because I needed a right shift and this is easy to do on a CSCvon8,
there is this syntax:

> *name*= *name2* >> num;

## Postincrement Operation

This syntax is supported:

> *name*++;

## Exiting the Program

If you want your program to stop in the *csim* simulator, or go into an
infinite loop on the real hardware, use this line:

> exit;

which inserts an infinite loop into the output.

## If Statement

The language supports if statements that are on one line:

> if (*name1* *op* *name2*) {

where the names are variables or numeric constants and the operations
include ```==```, ```!=```, ```<```, ```>```, ```<=``` and ```>=```.

## Else Statement

This has the syntax:

> } else {

and obviously must come after an if statement.

## While Loop

There is a while loop with the syntax:

> while (*name1* *op* *name2*) {

where the names are variables or numeric constants and the operations
include ```==```, ```!=```, ```<```, ```>```, ```<=``` and ```>=```.
There is a second syntax for an infinite loop:

> while (1) {

## Ending Loops and If Statements

A closed curly bracket on a line by itself ends the most recent if
statement or while loop:

> }

The compiler keeps a stack of if statements and while loops, so that you
can nest them.

## Breaking Out of a Loop

To break out of a loop, use the syntax:

> break;

just like the C command.

## Printing out Characters

The *putchar()* syntax allows you to print out an ASCII character:


<blockquote>
putchar(69);<br>
putchar(<i>name</i>);<br>
putchar('<i>x</i>');<br>
putchar('\n');
</blockquote>

where *name* is a variable and *x* is a single character. Example:

```
   var x;
   x= 65;
   putchar(x);
```

will print out an uppercase 'A'.

## Printing out Numbers

The *prhex()* and *prhexn()* syntax allows you to print out a variable as
two hex digits:

<blockquote>
prhex(<i>name</i>);  // Two hex digits, nothing else<br>
prhexn(<i>name</i>); // Two hex digits and a newline character
</blockquote>

Note that *prhex()* takes eighteen instructions and *prhexn()* takes twenty
instructions, so use these operations sparingly!

## Function Declaration

A function is declared with the syntax:

> function *name*(*param*) {

where the name is compulsory, but the single parameter is optional.

A function is ended with a closed curly bracket on a line by itself:

> }

There is no recursion in the language: you can only call a function once
at a time. There must be a function called *main* in your program, as the
compiler insert a JSR to *main* as the first instruction in the assembly
output. Due to the CPU's architecture, there can no more than 256
different calls to one function.

The parameter named in the function declaration is visible as a local
variable with that name in the function.

## Returning from a Function

Returning from a function is done with one of these two lines:

<blockquote>
return;<br>
return(<i>name</i>);
</blockquote>

where *name* is a variable defined in the function.

## An Example Function

Here is a full example function:

```
function increment(x) {
  x= x + 1;
  return(x);
}
```

## Calling a Function

A function call can be done with an optional argument which is copied into
the function parameter, and optionally with an assignment statement to save
the return value. Thus, there are four possible syntax variants:

<blockquote>
<i>function</i>();<br>
<i>function</i>(<i>arg</i>);<br>
<i>name</i>= <i>function</i>();<br>
<i>name</i>= <i>function</i>(<i>arg</i>);
</blockquote>

and *arg* has to be a variable not a constant.
</blockquote>

## No Optimisations

Finally, the compiler is very stupid one-pass compiler. It doesn't do any
optimisations, so there will be some space inefficiency in the code that
it produces.
