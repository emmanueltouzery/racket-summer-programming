#lang racket

(require 2htdp/image 2htdp/universe)
(require threading)

(define
 (snowman position)
 (~> (rectangle 500 300 "solid" "blue")
     (place-image/align
      (circle 20 "solid" "white") 240 (+ position 20) "left" "top" _)
     (place-image/align
      (circle 10 "solid" "white") 250 position "left" "top" _)))

(define (end? position)
        (>= position (- 300 60)))

(define (keypress position key)
        (printf "~a~n" key)
        (match key
               [(== "up") (- position 10)]
               [(== "down") (+ position 10)]
               [else position]))

(big-bang 0
          (on-tick add1)
          (on-draw snowman)
          (stop-when end?)
          (on-key keypress))
