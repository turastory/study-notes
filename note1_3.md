# SICP Note 1.3
### Formulating Abstractions with Higher-Order Procedures

```scheme
(define (cube x) (* x x x))
```

> we are not talking about the cube of a particular number, but rather about a method for obtaining the cube of any number … Of course we could get along without ever defining this procedure, by always writing expressions such as:  

```scheme
(* 3 3 3)
(* x x x)
(* y y y)
```

> This would place us at a serious disadvantage, forcing us to work always at **the level of the particular operations** that happen to be primitives in the language (multiplication, in this case) rather than **in terms of higher-level operations**.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What’s the meaning of the word `level` in this context?  

- It means a level of **abstraction**.  

> Our programs would be able to compute cubes, but our language would lack **the ability to express the concept of cubing**. One of the things we should demand from a powerful programming language is **the ability to build abstractions by assigning names to common patterns** and then to work in terms of the abstractions directly. Procedures provide this ability. This is why all but the most primitive programming languages include mechanisms for defining procedures.  

- Procedure provides an ability to give a name to some pattern of rules.  

> Often **the same programming pattern will be used with a number of different procedures**. To express such patterns as concepts, we will need to construct procedures that **can accept procedures as arguments or return procedures as values**. Procedures that manipulate procedures are called higher-order procedures. This section shows how higher-order procedures can serve as powerful abstraction mechanisms, vastly increasing the expressive power of our language.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. What is higher-order procedures?  

- A regular procedure provides an ability to make an abstraction by giving a name to common patterns.  
- With higher-order procedures, we can share common patterns across procedures.  
- Higher-order procedures take procedures as arguments or return procedures as values.  
- We’re kind of familiar with this concept. In modern languages like Kotlin, Typescript or Swift, procedures - functions can be used as variables or arguments.  

<br>

### Chapter 1.3.1 Procedures as Arguments

> … We could generate each of the procedures by filling in slots in the same template:  

```scheme
(define ([name] a b)
  (if (> a b)
      0
      (+ ([term] a)
         ([name] ([next] a) b))))
```

- Higher-order procedures abstract **structures**, while normal procedures abstract **operations**, or behaviors.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. But higher-order procedures are also normal procedures, aren’t they?  

- That’s true. Can we consider the common patterns - the structures as behaviors of a procedure? I don’t know. Anyway, higher-order procedure is a subset of procedures.  

> Indeed, mathematicians long ago identified the abstraction of summation of a series and invented “sigma notation” …  

- Sigma notation is an example of higher order function. It expresses the concept of summation - It abstracts the structure of summation, not particular summations.  

> … we would like our language to be powerful enough so that we can write a procedure that **expresses the concept of summation itself rather than only procedures that compute particular sums**.  

Higher-order procedure in Scheme:  
```scheme
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
```

With this procedure, we can define a process for a particular summation (sum of cubes, in this case):  
```scheme
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))
```

We can even define a process for the definite integral of a function f between the limits, a and b.  
![Integral of f between the limits a and b](part1/integral-of-f.jpg)  

We can express this directly as a procedure:  
```scheme
(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))
```

