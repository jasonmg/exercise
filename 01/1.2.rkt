#lang racket

(define res
  (/ (+ 5 4 (- 2 (- 3 ( + 6 (/ 4 5)))))
     (* 3 (- 6 2) (- 2 7)))
)

;; 1.3 定义一个过程 三个数为参数 返回其中较大的那一个

(define (larger x y)
  (if (> x y)
      x
      y))

;; 1.4

(define (a-plus-abs-b a b )
  ((if (> b 0 ) + -) a b))

;; lisp 解释器是应用序求值， 部分原因在与这样做可以避免对表达式的重复求值
;; 1.5
(define (p) p)

(define (test  x y)
  (if (= x 0)
      0
      y))
;; (test 0 (p)) 不会报错

;; 1.6

;; sqrt definetion 牛顿法求平方根

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;;

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter1 guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter1 (improve guess x)
                      x)))
(define (sqrt1 x)
  (sqrt-iter1 1.0 x))

;;;;;


(define (sqrt-iter2 pre-guess guess x)
  (if (good-enough2? pre-guess guess x)
      guess
      (sqrt-iter2 guess (improve guess x)
                 x)))

;; how to define good-enough2 ???
(define (good-enough2? pre-guess guess x)
  (< (/ (abs (- pre-guess guess)) x) 0.0001))

(define (sqrt2 x)
  (sqrt-iter2 1.0 1.0 x))

;; 1.8 pass
