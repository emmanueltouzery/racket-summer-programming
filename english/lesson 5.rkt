#lang racket

(require 2htdp/image 2htdp/universe)
(require threading)

(struct game-state (position-left position-top) #:transparent)

(define
 (draw-game state)
 (define position-left (game-state-position-left state))
 (define position-top (game-state-position-top state))
 (~> (rectangle 500 300 "solid" "violet")
     (snowman position-left position-top)
     (pillar state)))

(define
 (snowman drawing position-left position-top)
 (~>
  (place-image/align
   (circle 20 "solid" "light gray")
   (- position-left 10) (+ position-top 20) "left" "top" drawing)
  (place-image/align
   (circle 10 "solid" "white")
   position-left position-top "left" "top" _)))

(define
 (pillar drawing state)
 (~>
  (place-image/align (rectangle 40 100 "solid" "green")
                     0 0 "left" "top" drawing)
  (place-image/align (rectangle 40 80 "solid" "yellow")
                     0 220 "left" "top" _)))

(define (end? state)
  (>= (game-state-position-top state) (- 300 60)))

(define (keypress state key)
  (printf "~a~n" key)
  (define position-left (game-state-position-left state))
  (define position-top (game-state-position-top state))
  (match key
         [(== "up") (game-state position-left (- position-top 10))]
         [(== "down") (game-state position-left (+ 10 position-top))]
         [(== "left") (game-state (- position-left 10) position-top)]
         [(== "right") (game-state (+ position-left 10) position-top)]
         [else state]))

(define (ticker state)
  (game-state (game-state-position-left state)
              (add1 (game-state-position-top state))))

(big-bang (game-state 240  110)
          (on-tick ticker)
          (on-draw draw-game)
          (stop-when end?)
          (on-key keypress))
