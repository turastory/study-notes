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

; Nested Mappings
(define (enumerate-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime? n)
  (define (iter n i)
    (cond ((= (remainder n i) 0) #f)
          ((< n (* i i)) #t)
          (else (iter n (+ i 1)))))
  (iter n 2))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum (filter prime-sum? (enumerate-pairs n))))

; Exercise 2.40
(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

; Exercise 2.41
(define (sum-triples n s)
  (define (unique-triples n)
    (flatmap (lambda (i)
               (flatmap (lambda (j)
                          (map (lambda (k) (list i j k))
                               (enumerate-interval 1 (- j 1))))
                        (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))
  (define (triple-sum-equal? triple)
    (= (+ (car triple) (cadr triple) (caddr triple)) s))
  (filter triple-sum-equal? (unique-triples n)))

; Exercise 2.42
(define (queens board-size) 
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions)) 
          (flatmap
            (lambda (rest-of-queens) 
              (map (lambda (new-row)
                     (adjoin-position
                      new-row k rest-of-queens))
                   (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (make-pos column row) (list column row))
(define pos-column car)
(define pos-row cadr)

(define (adjoin-position row column positions)
  (append positions (list (make-pos column row))))

(define empty-board (list))

(define (safe-positions? p1 p2)
  (define (horizontal? p1 p2)
    (= (pos-column p1) (pos-column p2)))
  (define (vertical? p1 p2)
    (= (pos-row p1) (pos-row p2)))
  (define (diagonal? p1 p2)
    (= (abs (- (pos-column p1) (pos-column p2)))
       (abs (- (pos-row p1) (pos-row p2)))))
  (not (or (horizontal? p1 p2)
           (vertical? p1 p2)
           (diagonal? p1 p2))))

(define (safe? k positions)
  (let ((recent (last positions))
        (rest (take positions (- k 1))))
    (accumulate 
      (lambda (b1 b2) (and b1 b2)) 
      true 
      (map (lambda (position) (safe-positions? position recent))
           rest))))
