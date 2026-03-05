#lang sicp

(define (abs x) (if (> 0 x) (- x) x))
(define (square x) (* x x))
(define (cube x) (* x x x))

(define (good-enough? prev-guess guess)
    (< (abs (/ (- prev-guess guess) guess)) 0.00000001)
)

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3)
)

(define (cubert-iter prev-guess guess x)
    (if (good-enough? prev-guess guess)
        guess
        (cubert-iter
            guess
            (improve guess x)
            x
        )
    )
)

(define (cubert x) (cubert-iter 1.0 (improve 1.0 x) x))
(cubert (cube 251345216))
(cubert (cube -1))
(cubert (cube -9876543210))