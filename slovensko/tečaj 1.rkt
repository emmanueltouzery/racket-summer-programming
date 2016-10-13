#lang racket

(require "slovenscina.rkt")

(naj-bo minimum 0)
(naj-bo maksimum 1000)

(naj-bo
 (ugani-število)
 (če (= minimum maksimum)
     (printf "ZMAGAL SEM, rezultat je ~a~n" minimum)
     (printf "vem, da je rezultat med ~a in ~a~n" minimum maksimum))
 (deli (+ minimum maksimum) 2))

(naj-bo (manjše)
        (postavi! maksimum (- (ugani-število) 1))
        (ugani-število))

(naj-bo (večje)
        (postavi! minimum (+ 1 (ugani-število)))
        (ugani-število))