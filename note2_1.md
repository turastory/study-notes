# SICP Note 2.1
## 2 - Building Abstractions with Data
- The title of the first chapter was “Building abstractions with procedures”.  
- So the main topic changed from procedure to data.  

> In this chapter we are going to look at more complex data … we turn in this chapter to another key aspect of any programming language: the **means it provides for building abstractions by combining data objects to form compound data**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Why do we need to form compound data?  

> For the same reasons that we want compound procedures: to elevate the conceptual level at which we can design our programs, to increase the modularity of our designs, and to enhance the expressive power of our language.  

By using compound data, we can:  
1. Elevate the level of abstractions while designing the program.  
2. Increase modularity of program designs.  
3. Enhance expressive power of the language.  

- So basically what we can achieve are same as compound procedures.  

> The general technique of isolating the parts of a program that deal with how data objects are represented from the parts of a program that deal with how data objects are used is a powerful design methodology called **data abstraction.**  

- **Data abstraction: Separating data representation and data usage**  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is “expressive power” of the language?  

> … This same example shows why it is important that our programming language provide the **ability to manipulate compound objects directly**: Without this, there is no way for a procedure such as linear-combination to pass its arguments along to add and mul **without having to know their detailed structure.**  

- I think it means we only concern about the expression of the logic, and give much less attention to how the logic actually works.  
- In short, “expressive power” of the language is what the language provides as means of abstraction.  

> We will see that the key to forming compound data is that a programming language should provide some kind of **glue** so that data objects can be combined to form more complex data objects.  

Introduction to data abstraction and abstraction barriers -> Different ways to form compound data -> key ideas (closure, conventional interfaces) -> symbolic expressions -> generic operations -> data-directed programming  

###### Summary
- We covered compound data and its advantages, that are analogous to compound procedure.  
- We also saw a brief overview of part 2.  

## 2.1 Introduction to Data Abstraction
> … we could make an abstraction that would **separate the way the procedure would be used from the details of how the procedure would be implemented in terms of more primitive procedures.** The analogous notion for compound data is called **data abstraction**.  
> The basic idea of data abstraction is to structure the programs that are to use compound data objects so that they operate on “abstract data” …  

### Chapter 2.1.1 Example: Arithmetic Operations for Rational Numbers

> Let us begin by assuming that we already have a way of construct- ing a rational number from a numerator and a denominator. We also assume that, given a rational number, we have a way of extracting (or selecting) its numerator and its denominator. Let us further assume that the constructor and selectors are available as procedures:  
```scheme
; Constructor
(make-rat <n> <d>)
; Selectors
(numer <x>)
(denom <x>)
```

> We are using here a powerful strategy of synthesis: **wishful thinking**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Wishful thinking?  

- Assume some parts of the system already exist. Even if we didn’t implemented yet, we can make further procedural abstractions based on assumptions.  
- I feel this concept is similar to what Interface do, in OOP. With interface we only defines the structure - what is needed, what is returned, …  

> To enable us to implement the concrete level of our data abstraction, our language provides a compound structure called a pair, which can be constructed with the primitive procedure `cons`. This procedure takes two arguments and returns a compound data object that contains the two arguments as parts. Given a pair, we can extract the parts using the primitive procedures `car` and `cdr`.  

- Pair is a compound data structure, which can be constructed by the *primitive* procedure `cons`  
- We can access the elements of the pair using the primitive procedures `car`, `cdr`.  

> The single compound-data primitive `pair`, implemented by the procedures `cons`, `car`, and `cdr`, is the only glue we need. Data objects constructed from pairs are called list-structured data.  

With pairs, we can readily implement `make-rat`, `numer`, and `denom` as follows:  
```scheme
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
```

We can change the behavior of further procedures like additions or multiplication, without modifying the procedure, by changing `make-rat`:  
```schemme
(define (make-rat n d)
  (let ((g (gcd dn d)))
    (cons (/ n g) (/ d g))))
```

<br>

###### Exercise 2.1

> Define a better version of `make-rat` that handles both positive and negative arguments.  

```scheme
(define (make-rat n d)
  (let ((num (if (< (* n d) 0)
                 (- (abs n))
                 (abs n)))
        (den (abs d)))
    (let ((g (gcd num den)))
      (cons (/ num g) (/ den g)))))
```

