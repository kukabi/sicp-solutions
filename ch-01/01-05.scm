#lang sicp

(define (p) (p))
(define (test x y) (if (= x 0) 0 y))

(test 0 (p))
; applicative-order: evaluate the arguments and then apply (depth-first)
;                    evaluate arguments before passing them to the function (eager/strict)
;
;   (test 0 (p))
;   1. evaluate `test`: returns the defined function
;   2. evaluate `0`: returns 0
;   2. evaluate `(p)`: infinite loop
;   ...
;   (if (= 0 0) 0 (p))
;   ...
; => causes infinite loop

; normal-order: fully expand and then reduce (breadth-first)
;               substitute arguments unevaluated, only reduce when needed (lazy)
;
;   (test 0 (p))
;   (if (= 0 0) 0 (p))
;   0