; Exercise 1.34
(define (f g) (g 2))

; Chapter 1.3.3 - fingding zeros

(define tolerance 0.00001)
(define (average a b) (/ (+ a b) 2.0))
(define (close-enough? a b) (< (abs (- a b)) tolerance))
(define (negative? a) (< a 0))
(define (positive? a) (> a 0))

(define (search f neg pos)
  (let ((mid (average neg pos)))
    (if (close-enough? neg pos)
        mid
        (let ((test (f mid)))
          (cond ((positive? test)
                 (search f neg mid))
                ((negative? test)
                 (search f mid pos))
                (else mid))))))

(define (half-interval-method f a b)
  (let ((a-val (f a))
        (b-val (f b)))
    (cond ((and (negative? a-val) (positive? b-val))
           (search f a b))
          ((and (negative? b-val) (positive? a-val))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

; Chapter 1.3.3 - Fixed points of functions
(define (fixed-point f first-guess)
  (define (try guess)
    (let ((value (f guess)))
      (if (close-enough? guess value)
          value
          (try value))))
  (try first-guess))

(define (sqrt-mine x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
