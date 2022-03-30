; Chapter 2.1.1
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y)))) 
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (make-rat n d)
  (let ((num (if (< (* n d) 0)
                 (- (abs n))
                 (abs n)))
        (den (abs d)))
    (let ((g (gcd numden)))
      (cons (/ num g) (/ den g)))))
(define (numer x) (car x))
(define (denom x) (cdr x))


; Exercise 2.2
(define make-segment cons)
(define start-segment car)
(define end-segment cdr)
(define make-point cons)
(define x-point car)
(define y-point cdr)
(define (add-point p1 p2)
  (make-point (+ (x-point p1) (x-point p2))
              (+ (y-point p1) (y-point p2))))
(define (div-point p num)
  (make-point (/ (x-point p) num) 
              (/ (y-point p) num)))
(define (midpoint-segment line)
  (let ((start (start-segment line))
        (end (end-segment line)))
    (div-point (add-point start end) 2)))
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Exercise 2.3
(define (sub-point p1 p2)
  (make-point (- (x-point p1) (x-point p2))
              (- (y-point p1) (y-point p2))))
(define (make-rect p1 p2) (cons p1 p2))
(define (width-rect r)
  (abs (x-point (sub-point (car r) (cdr r)))))
(define (height-rect r)
  (abs (y-point (sub-point (car r) (cdr r)))))

(define (perimeter-rect r)
  (+ (* 2 (width-rect-alt r))
     (* 2 (height-rect-alt r))))
(define (area-rect r)
  (* (width-rect-alt r) (height-rect-alt r)))

(define (make-rect-alt p w h) (cons (cons w h) p))
(define (width-rect-alt r) (car (car r)))
(define (height-rect-alt r) (cdr (car r)))

; Exercise 2.5
(define (my-cons a b)
  (* (expt 2 a) (expt 3 b)))
(define (product-access-with-base base)
  (lambda (z)
    (define (f value depth)
      (if (= (remainder value base) 0)
          (f (/ value base) (+ depth 1))
          depth))
    (f z 0)))
(define (my-car z) ((product-access-with-base 2) z))
(define (my-cdr z) ((product-access-with-base 3) z))

; Exercise 2.6
(define zero (lambda (f) (lambda (x) x)))
(define (add-one n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))
(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

; Exercise 2.7
(define (make-interval a b) (cons a b))
(define (lower-bound z) (car z))
(define (upper-bound z) (cdr z))

; Exercise 2.8
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y) (mul-interval
   x
   (make-interval (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

; Exercise 2.9
(define (width-interval z)
  (/ (abs (- (lower-bound z) (upper-bound z))) 2.0))

; Exercise 2.10
(define (div-interval-imp x y) 
  (if (or (= (upper-bound y) 0) 
          (= (lower-bound y) 0) 
          (< (* (upper-bound y) (lower-bound y)) 0))
      "div by zero error"
      (mul-interval
        x
        (make-interval (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y))))))

; Exercise 2.12
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c p)
  (let ((dist (* c p)))
    (make-interval (- c dist) (+ c dist))))
(define (percent i)
  (/ (width i) (center i)))
