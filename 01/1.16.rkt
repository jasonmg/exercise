#lang racket

(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))


(define (expt-in product b n)
  (if (= 0 n)
      product
      (expt-in (* product b) b (- n 1))))

(define (expt-liner b n)
  (expt-in 1 b n))

;; 1.16

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (fast-expt-in b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-in (square b) (/ n 2) a))
        (else (fast-expt-in b (- n 1) (* a b)))))

(define (fast-expt b n)
  (fast-expt-in b n 1))