#lang racket

;; 帕斯卡三角形

;递归算法
(define (triangle row col)
  (cond ((> col row) -1)
        ((= col 1) 1)
        ((= col row) 1)
        (else (+ (triangle (- row 1) (- col 1))
                 (triangle (- row 1) col)))))


;迭代算法
