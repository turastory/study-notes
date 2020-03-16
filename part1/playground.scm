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

; Exercise 1.35
(define golden-ratio
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

; Exercise 1.36
(define (fixed-point-print f first-guess)
  (define (try guess)
    (newline)
    (display guess)
    (let ((value (f guess)))
      (if (close-enough? guess value)
          value
          (try value))))
  (try first-guess))

(define (xx1000-without-damping)
  (fixed-point-print (lambda (x) (/ (log 1000) (log x))) 3))

(define (xx1000-with-damping)
  (fixed-point-print (lambda (x) (average x (/ (log 1000) (log x)))) 3))

; Exercise 1.37.a
(define (cont-frac n d k)
  (define (f i)
    (if (> i k)
        0
        (/ (n i)
           (+ (d i) (f (+ i 1))))))
  (f 1))

(define (reciprocal-golden-ratio precision)
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 1.0)
             precision))

; Exercise 1.37.b
(define (cont-frac-iter n d k)
  (define (f i result)
    (if (= i 0)
        result
        (f (- i 1)
           (/ (n i) (+ (d i) result)))))
  (f k 0))

; Exercise 1.38
(define (euler-expansion precision) 
  (cont-frac (lambda (i) 1.0)
             (lambda (i) 
               (if (= (remainder (+ i 1) 3) 0)
                   (let ((exponent (/ (+ i 1) 3)))
                     (expt 2 exponent))
                   1))
             precision))
(define (natural-constant precision) (+ (euler-expansion precision) 2))

; Exercise 1.39
(define (tan-cf x k)
  (cont-frac (lambda (i) 
               (if (= i 1)
                   x
                   (- (expt x 2))))
             (lambda (i)
               (- (* i 2.0) 1.0))
             k))

; Chapter 1.3.4
(define dx 0.00001)
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (sqrt-newtons x)
  (newtons-method (lambda (y) (- (square y) x)) 1.0))

; Exercise 1.40
(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

; Exercise 1.41
(define (double f) (lambda (x) (f (f x))))
