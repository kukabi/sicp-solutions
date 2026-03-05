#lang sicp

(define (abs x) (if (> 0 x) (- x) x))
(define (square x) (* x x))
(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001)
)
(define (average x y) (/ (+ x y) 2))
(define (improve guess x)
    (average guess (/ x guess))
)
(define (sqrt-iter guess x)
    (if (good-enough? guess x) 
        guess
        (sqrt-iter (improve guess x) x)
    )
)
(define (sqrt x) (sqrt-iter 1.0 x))
(sqrt 3)
(sqrt 9)

; now try it with the new if statement.
; explanation from sicp-solutions.net (remember applicative-form):
; since new-if is a function, and not a special form,
; each parameter subexpression will be evaluated before the procedure is applied.
; it means that when executing the new-sqrt-iter function,
; (good-enough? guess x), guess and (sqrt-iter (improve guess x) x) will always be
; evaluated before new-if is applied, whatever (good-enough? guess x) evaluates to.
(define (new-if p t e) (cond (p t) (else e)))
(define (new-sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (new-sqrt-iter (improve guess x) x)
    )
)
(define (new-sqrt x) (new-sqrt-iter 1.0 x))
; causes infinite loop:
; (new-sqrt-iter 1.0 4) 