(define (memq sym l)
  (cond ((null? l) #f)
        ((eq? sym (car l)) l)
        (else (memq sym (cdr l)))))

(define (equal? l1 l2)
  (cond ((not (= (length l1) (length l2))) #f)
        ((and (null? l1) (null? l2)) #t)
        ((or (null? l1) (null? l2)) #f)
        (else (let ((a (car l1))
                    (b (car l2)))
                   (if (eq? a b)
                     (equal? (cdr l1) (cdr l2))
                     #f)))))

; differentiation algorithm
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
           (make-sum (make-product (multiplier exp) (deriv (multiplicand exp) var)) 
                     (make-product (multiplicand exp) (deriv (multiplier exp) var))))
        ((exponentiation? exp)
           (make-product
             (exponent exp)
             (make-product (make-exponentiation (base exp) (- (exponent exp) 1))
                           (deriv (base exp) var))))
        (else (error "unknown expression type: DERIV" exp))))

(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**)))
(define (make-exponentiation b e)
  (cond ((= e 1) b)
        ((= e 0) 1)
        (else (list '** b e))))
(define (base e) (cadr e))
(define (exponent e) (caddr e))

(define (variable? e) (symbol? e))
(define (same-variable? x y)
  (and (variable? x) (variable? y) (eq? x y)))
(define (=number? exp num) (and (number? exp) (= exp num)))
(define (make-sum x y) 
  (cond ((and (number? x) (number? y)) (+ x y))
        ((=number? x 0) y) 
        ((=number? y 0) x) 
        ((sum? y) (list '+ x (addend y) (augend y)))
        ((sum? x) (list '+ (addend x) (augend x) y))
        (else (list '+ x y))))
; (* x (* y z))
; (* x y z)
(define (make-product x y) 
  (cond ((and (number? x) (number? y)) (* x y))
        ((=number? x 1) y)
        ((=number? y 1) x)
        ((or (=number? x 0) (=number? y 0)) 0)
        ((product? y) (list '* x (multiplier y) (multiplicand y)))
        ((product? x) (list '* y (multiplier x) (multiplicand x)))
        (else (list '* x y))))
(define (sum? e) (and (pair? e) (eq? (car e) '+)))
(define (addend e) (cadr e))
; ('+ 1 2 ('+ 3 4))
; ('+ 2 ('+ 3 4))
; ('+ 3 4)
(define (augend e) 
  (cond ((= (length (cddr e)) 1) (caddr e))
        (else (make-sum (caddr e) (cadddr e)))))
(define (product? e) (and (pair? e) (eq? (car e) '*)))
(define (multiplier e) (cadr e))
(define (multiplicand e) 
  (cond ((= (length (cddr e)) 1) (caddr e))
        (else (make-product (caddr e) (cadddr e)))))
