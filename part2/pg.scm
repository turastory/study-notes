; Chapter 2.2.1
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

; Exercise 2.17
(define (last-pair items)
  (let ((left (cdr items)))
    (if (null? left)
        (car items)
        (last-pair left))))

(define (reduce items g)
  (let ((left (cdr items)))
     (if (null? left)
         (g items)
         (reduce left))))

; Exercise 2.18
(define (reverse items)
  (define (f input output)
    (if (null? input)
      output
      (f (cdr input) (cons (car input) output))))
  (f items (list)))

; Exercise 2.19
; Recall from Chapter 1.2.2
(define (count-change amount) (cc-old amount 5))
(define (cc-old amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0) 
        (else (+ (cc-old amount 
                         (- kinds-of-coins 1))
                 (cc-old (- amount
                            (first-denomination-old
                             kinds-of-coins))
                         kinds-of-coins)))))
(define (first-denomination-old kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1) 
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

; New (2.19)
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

; Exercise 2.20
(define (filter l condition)
  (if (null? l)
      l
      (if (condition (car l))
          (cons (car l) (filter (cdr l) condition))
          (filter (cdr l) condition))))

(define (same-parity first . rest)
  (let ((condition (if (even? first)
                       even?
                       odd?)))
    (cons first (filter rest condition))))

; Chapter 2.2.1 - Mapping over lists
(define (map proc items)
  (if (null? items)
    '()
    (cons (proc (car items))
          (map proc (cdr items)))))

; Exercise 2.22
(define (square-list items)
  (define (iter things answer) 
    (if (null? things)
         answer 
         (iter (cdr things)
               (cons answer
                     (square (car things))))))
  (iter items (list)))

; Exercise 2.23
(define (for-each f items)
  (cond ((null? items) #t)
        (else (f (car items))
              (for-each f (cdr items)))))

; Chapter 2.2.2 Hierarchical Structures
(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree))
                 (count-leaves (cdr tree))))))

; Exercise 2.27
(define (deep-reverse items)
  (define (f input output)
    (cond ((null? input) output)
          ((not (pair? input)) input)
          (else (f (cdr input) (cons (deep-reverse (car input)) output)))))
  (f items (list)))

; Exercise 2.28
(define (fringe items)
  (define (f input output)
    (cond ((null? input) output)
          ((not (pair? input)) (cons input output))
          (else (f (car input) (f (cdr input) output)))))
  (f items (list)))

; Exercise 2.29
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))

; 2.29 - a
(define (left-branch mobile) (car mobile))
(define (right-branch mobile) (cadr mobile))
(define (branch-length branch) (car branch))
(define (branch-structure branch) (cadr branch))

; 2.29 - b
(define (total-weight entity)
  (cond ((null? entity) 0)
        ((not (pair? entity)) entity)
        ((not (pair? (branch-structure entity))) (branch-structure entity))
        (else (+ (total-weight (left-branch entity)) ; Mobile
                 (total-weight (right-branch entity))))))

; 2.29 - c
(define (torque branch)
  (* (branch-length branch) 
     (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (cond ((null? mobile) #f)
        ((not (pair? mobile)) #t)
        (else (and (= (torque (left-branch mobile)) (torque (right-branch mobile)))
                   (balanced? (branch-structure (left-branch mobile)))
                   (balanced? (branch-structure (right-branch mobile)))))))

(define (scale-tree tree factor) 
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree factor))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))

(define (scale-tree-map tree factor) 
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree-map sub-tree factor)
             (* sub-tree factor)))
       tree))

; Exercise 2.30
(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
       tree))

; Exercise 2.31
(define (tree-map f tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map f sub-tree)
             (f sub-tree)))
       tree))

(define (square-tree-map-abstracted tree)
  (tree-map square tree))

; Exercise 2.32
(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (list) (cons (car s) list)) 
                          rest)))))
