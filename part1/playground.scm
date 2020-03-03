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

