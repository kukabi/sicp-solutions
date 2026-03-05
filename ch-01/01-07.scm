#lang sicp

(define (abs x) (if (> 0 x) (- x) x))
(define (square x) (* x x))
(define (good-enough? prev-guess guess)
    (< (abs (/ (- prev-guess guess) guess)) 0.00000001)
)
(define (average x y) (/ (+ x y) 2))
(define (improve guess x)
    (average guess (/ x guess))
)
; sqrt-iter now takes both the previous
; and current guesses as parameter
(define (sqrt-iter prev-guess guess x)
    (if (good-enough? prev-guess guess)
        guess
        (sqrt-iter
            guess
            (improve guess x)
            x
        )
    )
)
; the interface of sqrt remains the same
(define (sqrt x) (sqrt-iter 1.0 (improve 1.0 x) x))
;(sqrt (square 251345216))
(sqrt (square 0.000001))