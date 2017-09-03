#lang racket


(define (% x y)
  (cond ((< x y) x)
        ((= x y) 0)
        (else (% (- x y) y))))

;; 1.9

(define (inc x)
  (+ x 1))

(define (dec x)
  (- x 1))

;; 线性迭代过程
(define (+?? a b)
  (if (= a 0)
      b
      (inc (+?? (dec a) b))))

;; 线性递归过程
(define (+? a b)
  (if (= a 0)
      b
      (+? (dec a) (inc b))))

;; 1.10  Ackermann函数
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))


;; 递归计算过程
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

;; 迭代计算过程
(define (fib-liner n)
  (define (fib-in a b count)
  (if (= count 0)
      b
      (fib-in (+ a b) a (- count 1))))
  (fib-in 1 0 n))


;; 1.11
;; 线性递归过程
(define (fn n)
  (if (< n 3)
      n
      (+ (fn (- n 1))
         (* 2 (fn (- n 2)))
         (* 3 (fn (- n 3))))))

;; 线性迭代过程
(define (fn-in n a b c count)
  (cond ((< n 3) n)
        ((= n count) a)
        (else
         (fn-in n (+ a (* 2 b) (* 3 c)) a b (+ count 1)))))

(define (fn-liner n)
  (fn-in n 2 1 0 2))


;; 换零钱 

(define (cc amount kind-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kind-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kind-of-coins 1))
                 (cc (- amount
                        (first-denomination kind-of-coins))
                     kind-of-coins)))))

(define (first-denomination kind-of-coins)
  (cond ((= kind-of-coins 1) 1)
        ((= kind-of-coins 2) 5)
        ((= kind-of-coins 3) 10)
        ((= kind-of-coins 4) 25)
        ((= kind-of-coins 5) 50)))

(define (count-change amount)
  (cc amount 1))


