# SICP Note 2.3
## Symbolic Data
Now it’s time for symbolic data!  

### Quotation
- We can use single quote at the beginning of the object to indicate that the expression is a symbol, not the value.  

> The quotation mark is just a single-character abbreviation for wrapping the next complete expression with quote to form `(quote ⟨expression⟩)`  
- `(quote a)` is same as `'a`  

<br>

###### Exercise 2.53

```scheme
(list 'a 'b 'c)
=> (a b c)
(list (list 'george))
=> ((george))
(cdr '((x1 x2) (y1 y2)))
=> ((y1 y2))
(cadr '((x1 x2) (y1 y2)))
=> (y1 y2)
(pair? (car '(a short list)))
=> #f
(memq 'red '((red shoes) (blue socks)))
=> #f
(memq 'red '(red shoes blue socks))
=> (red shoes blue socks)
```

<br>

###### Exercise 2.54
```scheme
(define (equal? l1 l2)
  (cond ((not (= (length l1) (length l2))) #f)
        ((and (null? l1) (null? l2)) #t)
        ((or (null? l1) (null? l2)) #f)
        (else (let ((a (car l1))
                    (b (car l2)))
                   (if (eq? a b)
                     (equal? (cdr l1) (cdr l2))
                     #f)))))
```

<br>

###### Exercise 2.55
Recall that `’a` for an arbitrary object `a` is actually equal to the following expression: `(quote a)`. So the following expression translates like this:  
```scheme
''abracadabra
=> (quote (quote abracadabra))
(car ''abracadabra)
=> (car (quote (quote abracadabra)))
=> (car '(quote abracadabra))
=> quote
```

<br>

### Example: Symbolic Differentiation

Data abstraction strategy - first define an algorithm using abstract concepts, without worrying about the actual implementations of them, and then address the representation problem.  

###### Exercise 2.56
```scheme
; Definition of algorithm
((exponentiation? exp)
   (make-product
     (exponent exp)
     (make-product
       (make-exponentiation (base exp) (- (exponent exp) 1))
       (deriv (base exp) var))))

; Representations for exponentiation
(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**)))
(define (make-exponentiation b e)
  (cond ((= e 1) b)
        ((= e 0) 1)
        (else (list '** b e))))
(define (base e) (cadr e))
(define (exponent e) (caddr e))

```

<br>

###### Exercise 2.57
```scheme
; New terms for make-sum
((sum? y) (list '+ x (addend y) (augend y)))
((sum? x) (list '+ (addend x) (augend x) y))

; New terms for make-product
((product? y) (list '* x (multiplier y) (multiplicand y)))
((product? x) (list '* y (multiplier x) (multiplicand x)))

; New definition of augend, multiplicand
(define (augend e) 
  (cond ((= (length (cddr e)) 1) (caddr e))
        (else (make-sum (caddr e) (cadddr e)))))

(define (multiplicand e) 
  (cond ((= (length (cddr e)) 1) (caddr e))
        (else (make-product (caddr e) (cadddr e)))))

```
