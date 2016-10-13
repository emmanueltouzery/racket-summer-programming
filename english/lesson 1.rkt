#lang racket

(define minimum 0)
(define maximum 100)

(define
 (guess)
 (if (= minimum maximum)
     (printf "I WON, the result is ~a~n" minimum)
     (printf "I know the result is between ~a and ~a~n" minimum maximum))
 (quotient (+ minimum maximum) 2))

(define (smaller)
  (set! maximum (sub1 (guess)))
  (guess))

(define (bigger)
  (set! minimum (add1 (guess)))
  (guess))