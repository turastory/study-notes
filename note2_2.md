# SICP Note 2.2
### Hierarchical Data and the Closure Property

> As a consequence, pairs pro- vide a universal building block from which we can construct all sorts of data structures.  

> The ability to **create pairs whose elements are pairs** is the essence of list structure’s importance as a representational tool. We refer to this ability as the **closure property** of `cons`.   
> In general, an operation for combining data objects satisfies the closure property if the results of combining things with that operation can themselves be combined using the same operation.  

> Closure is the key to power in any means of combination, because it permits us to create **hierarchical structures** - structures made up of parts, which themselves are made up of parts, and so on.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. How is it different from the usual “closure” that we know?  

> The use of the word “closure” here comes from abstract algebra, where a set of elements is said to be closed under an operation if applying the operation to elements in the set produces an element that is again an element of the set.  
> The Lisp community also uses the word “closure” to describe a totally unrelated concept: A closure is an implementation technique for representing procedures with free variables.  

- So there it is. The word “closure” in the second context, does not really mean any sort of concepts.  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q. Seems like we’ve already seen the closure property in part 1. Is there any relation between compound procedures and the closure property?  

> From the outset of Chapter 1, we’ve made essential use of closure in dealing with procedures, because all but the very simplest programs rely on the fact that the elements of a combination can themselves be combinations.  

- We’ve already used it! Combination - a compound procedure is one of the examples of the closure property.  

> “It is better to have 100 functions operate on one data structure than to have 10 functions operate on 10 data structures.”  

- This statement is used as a virtue of functional programming. From another perspective, if you can make a new data structure just like any functions, then does this statement exist?  
- The authors make an interesting claim about it.   

<br>

### 2.2.1 Representing Sequences

> One of the useful structures we can build with pairs is a **sequence** - an ordered collection of data objects.  

- It’s a list! How can we make such a list using `cons`?  
- Think about linked list. Each node has its own item and a reference to the next node. By sequentially calling `cons` like this, we can represent a sequence just like linked list:  
```scheme
(cons 1
      (cons 2
            (cons 3
                  (cons 4 nil))))
```

- This could be simplified with `list` primitive:  
```scheme
(list 1 2 3 4)
```

- One thing to note here, is that we should distinguish a `list` which means a chain of pairs from a `list structure` which refers to any data structure made out of pairs.  
- **Any** data structure? I’m confused.  

> Be careful not to confuse the expression `(list 1 2 3 4)` with the list `(1 2 3 4)`, which is the result obtained when the expression is evaluated. Attempting to evaluate the expression `(1 2 3 4)` will signal an error when the interpreter tries to apply the procedure 1 to arguments 2, 3, and 4.   
   
- In the following code snippet…  
```scheme
(list 1 2 3 4)
(1 2 3 4)
```
- **The former expression produces the latter expression.**  

<br>

###### Exercise 2.17

> Define a procedure `last-pair` that returns the list that contains only the last elements of a given list.  

Expected result:  
```scheme
(last-pair (list 1 2 3 4 5))
(5)
```

- Let’s ignore the case where the list is empty.  
- How can we detect “the end of the list”?  
1. Apply `cdr` to the list.  
2. If it is empty, return the result of applying `car` to the list.  
3. If it is not empty, return last pair of the result of applying `car` to the list.  
```scheme
(define (last-pair items)
  (let ((left (cdr items)))
    (if (null? left)
        (car items)
        (last-pair left))))
```

<br>

###### Exercise 2.18

> Define a procedure `reverse` that takes a list as argument and returns a list of the same elements in reverse order:  

Expected result:  
```scheme
(reverse (list 1 4 9 16 25))
(25 16 9 4 1)
```

- We need `car` to take the first element of the list, `cdr` to pass the remainder of the list, and `cons` to combine the element in reverse order.  

```scheme
(define (reverse items)
  (define (f input output)
    (if (null? input)
      output
      (f (cdr input) (cons (car input) output))))
  (f items (list)))
```
(I think It’s easier to come up with iterative solution in this case.)  


###### Exercise 2.19

> We want to rewrite the procedure `cc` so that its second argument is a list of the values of the coins to use rather than an integer specifying which coins to use.  

Old version:  
```scheme
; Recall from Chapter 1.2.2
(define (count-change amount) (cc-old amount 5))
(define (cc-old amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0) 
        (else (+ (cc-old amount 
                         (- kinds-of-coins 1))
                 (cc-old (- amount
                            (first-denomination
                             kinds-of-coins))
                         kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1) 
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
```
- Back in Chapter 1.2.2, we didn’t realized but the procedure `first-denomination` was actually a selector for some hidden data structure.  
- There’s no constructor procedure, though. It’s because the data structure is fixed with the definition of the procedure.  

So what we’re going to do is to reveal the hidden data structure, and implement corresponding constructor and selector procedures in terms of list.  

- First, replace the definition of the procedure `first-denomination` with an application of `list` primitive:  
```scheme
; Old
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1) 
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; New
(define us-coins (list 50 25 10 5 1))
```

- Next, replace the condition for the existence of remaining coins with `null?` primitive:  
```
; Old
(= kinds-of-coins 0)

; New
(null? coins)
```

- Next, replace the application of the procedure `first-denomination` with the application of `car` primitive:  
```scheme
; Old
(define (cc amount kinds-of-coins) ...
  (first-denomination kinds-of-coins)

; New
(define (cc amount coins) ...
  (car coins)
```

- Next, replace the subtraction of `kinds-of-coins` with the application of `cdr` primitive:  
```scheme
; Old 
(- kinds-of-coins 1)

; New
(cdr coins)
```

- Resulting new version of `cc`, along with other auxiliary procedures:  
```scheme
(define (cc amount coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coins)) 0) 
        (else (+ (cc amount 
                     (except-first-denomination coins))
                 (cc (- amount
                        (first-denomination
                         coins))
                     coins)))))

(define no-more? null?)
(define except-first-denomination cdr)
(define first-denomination car)
```

> Does the order of the list `coin` affect the answer produced by `cc`? Why or why not?  

- It doesn’t matter. I guess it’s because no matter how the order of the list is, we always fully iterate the whole list and they are completely independent of each others.  

