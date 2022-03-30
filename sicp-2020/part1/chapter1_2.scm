(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0)
)

(define (divides? a b)
  (= (remainder b a) 0)
)


; Chapter 1.2.6
(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))
  )
)

(define (prime? n)
  (= n (smallest-divisor n))
)

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
           (square (expmod base (/ exp 2) m))
           m))
        (else
          (remainder
            (* base (expmod base (- exp 1) m))
            m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n ) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times) 
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1))) 
        (else false)))


; Exercise 1.22
(define (timed-prime-test n)
  (newline)
  (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
  (if (fast-prime? n 1)
      (report-prime n (- (runtime) start-time))
  )
)

(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
)

(define (find-primes-in-range start end)
  (define (f start end)
    (timed-prime-test start)
    (find-primes-in-range (+ start 2) end)
  )
  (cond ((> start end) (display "end"))
        (else (if (even? start)
                  (find-primes-in-range (+ start 1) end)
                  (f start end)
              )
        )
  )
)

; Exercise 1.23
(define (next n)
  (if (= n 2) 3 (+ n 2)))

; Chapter 1.3.1
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

; Exercise 1.29
(define (sum-index mapper a b)
  (if (> a b)
      0
      (+ (mapper a)
         (sum-index mapper (+ a 1) b))))

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (yof k) (f (+ a (* k h))))
  (define (mapper index)
    (define y (yof index))
    (cond ((or (= index 0) (= index n)) y)
          ((even? index) (* y 2))
          (else (* y 4))))
  (* (/ h 3) (sum-index mapper 0 n))
)

; Exercise 1.30
(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

; Exercise 1.31.a
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (identity x) x)
  (define (addOne x) (+ x 1))
  (product identity 1 addOne n))

(define (pi-approx p)
  (define (numerator x)
    (+ (if (even? x)
           x
           (+ x 1))
       2))
  (define (denominator x)
    (+ (if (even? x)
           x
           (- x 1))
       3))
  (define (term x)
    (/ (numerator x)
       (denominator x)))
  (define (addOne x) (+ x 1))
  (product term 0 addOne p))

; Exercise 1.31.b
(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

; Exercise 1.32.a
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

; Exercise 1.32.b
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

; Exercise 1.33
(define (filtered-accumulate combiner null-value predicate
                             term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (if (predicate a)
                           (combiner (term a) result)
                           result))))
  (iter a null-value))

; Exercise 1.33.a
(define (sum-of-squares-of-prime a b)
  (filtered-accumulate + 0 prime?
                       square a addOne b))

; Exercise 1.33.b
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (fff n)
  (define (relatively-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate * 1 relatively-prime?
                       identity 1 addOne (- n 1)))
