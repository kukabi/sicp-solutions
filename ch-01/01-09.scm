#lang sicp

; recursive
(define (plus_a a b)
  (if (= a 0) 
      b 
      (inc (plus_a (dec a) b))))
(plus_a 4 5)

; (plus_a 4 5)
; (inc (plus_a 3 5))
; (inc (inc (plus_a 2 5)))
; (inc (inc (inc (plus_a 1 5))))
; (inc (inc (inc ((inc (plus_a 0 5))))))
; (inc (inc (inc ((inc 5)))))
; (inc (inc (inc (6))))
; (inc (inc 7))
; (inc 8)
; 9

; iterative
(define (plus_b a b)
  (if (= a 0) 
      b 
      (plus_b (dec a) (inc b))))
(plus_b 4 5)

; (plus_b 3 6)
; (plus_b 2 7)
; (plus_b 1 8)
; (plus_b 0 9)
; 9