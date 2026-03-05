#lang sicp

(define (cubert x)
    (define (cubert-iter prev-guess guess x)
        (define (good-enough?)
            (define (abs a) (if (> 0 a) (- a) a))
            (< (abs (/ (- prev-guess guess) guess)) 0.00000001)
        )
        (define (improve)
            (define (square a) (* a a))
            (/ (+ (/ x (square guess)) (* 2 guess)) 3)
        )
        (if (good-enough?)
            guess
            (cubert-iter
                guess
                (improve)
                x
            )
        )
    )
    (cubert-iter 1.0 2.0 x)
)

(define (cube x) (* x x x))
(cubert (cube 251345216))
(cubert (cube -1))
(cubert (cube -9876543210))