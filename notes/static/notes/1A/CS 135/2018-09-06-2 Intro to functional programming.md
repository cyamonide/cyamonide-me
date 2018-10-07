# 2018-09-06-2 Introduction to functional programming

## Programming language design

__Imperative:__ based on frequent changes to data  
Java, C++, Turing  
__Functional:__ based on the computation of new values rather than the transformation of old ones  
Excel formulae, LISP, ML, Haskell, Erlang, F#  

## Functional vs imperative

Functional and imperative programming share many concepts  
They are completely different ways of thinking about solving problems  

## Racket

* functional programming language
* minimal but powerful syntax
* small toolbox with ability to construct additional required tools
* interactive emulator
* dialect of Scheme

## Values, expressions, and functions

__Values__ are numbers or  other mathematical objects  
e.g. $5, 4/9, \pi$  
__Expressions__ combine values with _operators_ and functions  
e.g. $5 + 2, \sin{2\pi}$  

Now, is $4/9$ four ninths or four divided by nine? Is it a value, or a value operator value?  

__Functions__ generalize similar expressions.

## Functions in mathematics

Consider the function definitions: $f(x) = x^2, g(x, y) = x + y$  

These def'ns consist of:
* the name of the function (e.g. $g$)
* its parameters (e.g. $x, y$)
* an algebraic expression using the parameters as placeholders for values to be supplied in the future

An __application__ of a function supplies arguments for the parameters, which are substituted into the algebraic expression.

The arguments supplied may be themselves _applications_.  

We __evaluate__ each of the arguments to yield values.  