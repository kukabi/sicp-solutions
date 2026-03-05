#lang sicp

(define (sqrt x)
    (define (sqrt-iter prev-guess guess x)
        (define (good-enough?)
            (define (abs a) (if (> 0 a) (- a) a))
            (< (abs (/ (- prev-guess guess) guess)) 0.00000001)
        )
        (define (improve)
            (define (average a b) (/ (+ a b) 2))
            (average guess (/ x guess))
        )
        (if (good-enough?)
            guess
            (sqrt-iter guess (improve) x)
        )
    )
    (sqrt-iter 0.0 1.0 x)
)

(define (square x) (* x x))
(sqrt (square 251345216))
;(sqrt (square 0.000001))