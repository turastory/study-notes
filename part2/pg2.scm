; Chapter 2.2.3
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))

(define (even-fibs n)
  (define (next k)
    (if (> k n)
        '()
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

; Filter out the given sequence with the predicate.
(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

; Accumulate the sequence with the op, starting with initial value.
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))

; Generate a sequence from start to end, inclusively.
(define (enumerate-interval start end)
  (if (> start end)
      '()
      (cons start (enumerate-interval (+ start 1) end))))

; Generate a sequcne from the given tree.
(define (enumerate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))

(define (sum-odd-squares2 tree)
  (accumulate
    + 0 (map square (filter odd? (enumerate-tree tree)))))

(define (fib n)
  (cond ((= n 0) 0)
        ((<= n 2) 1)
        (else (+ (fib (- n 1)) (fib (- n 2))))))

(define (even-fibs2 n)
  (accumulate
    cons '() (filter even? (map fib (enumerate-interval 0 n)))))

; Exercise 2.33
;(define (map p sequence)
;  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))
(define (length sequence)
  (accumulate (lambda (item sum) (+ 1 sum)) 0 sequence))

; Exercise 2.34
(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) 
                (+ this-coeff (* higher-terms x)))
              0
              coefficient-sequence))

; Exercise 2.35
(define (count-leaves-original tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves-original (car tree))
                 (count-leaves-original (cdr tree))))))

(define (count-leaves tree)
  (accumulate +
              0
              (map (lambda (t)
                     (cond ((null? t) 0)
                           ((pair? t) (count-leaves t))
                           (else 1)))
                   tree)))

(define (count-leaves-enumerate tree)
  (length (enumerate-tree tree)))

; Exercise 2.36
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

; Exercise 2.37
(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
  (map (lambda (c) (dot-product v c)) m))
(define (transpose mat)
  (accumulate-n cons '() mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (c) (matrix-*-vector n c)) m)))

; Exercise 2.38
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest)) (cdr rest))))
  (iter initial sequence))
(define fold-right accumulate)

; Exercise 2.39
(define (push value sequence)
  (fold-right cons (list value) sequence))
(define (reverse1 sequence)
  (fold-right push '() sequence))
(define (reverse2 sequence)
  (fold-left (lambda (x y) (cons y x)) '() sequence))
