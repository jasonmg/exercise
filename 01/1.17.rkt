#lang racket

(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

(define (double a)
  (* a 2))

(define (halve a)
  (if (= (remainder a 2) 0)
      (/ a 2)
      -1))

(define (even? a)
  (= (remainder a 2) 0))

;; 1.17

(define (fast-mult a b)
  (cond
    ((= b 1) a)
    ((even? b) (fast-mult (* a 2) (/ b 2)))
    (else (+ a
             (fast-mult a (- b 1))))))

;; 1.18
;;1.17迭代计算

(define (mult-in sum a n)
  (cond
    ((= n 1) sum)
    ((even? n) (mult-in (+ sum a) (* a 2) (/ n 2)))
    (else (+ a
             (mult-in (+ sum a) (* a 2) (/ (- n 1) 2))))))

(define (mult a b)
  (mult-in a a b))