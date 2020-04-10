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
