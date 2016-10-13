#lang racket

(require 2htdp/image 2htdp/universe)
(require threading)

(struct game-state (pillar-left pillar-height snowman-top) #:transparent)

(define snowman-left 100)
(define pillar-opening 100)
(define height-playground 300)

(define
 (draw-game state)
 (define pillar-left (game-state-pillar-left state))
 (define snowman-top (game-state-snowman-top state))
 (~> (rectangle 500 height-playground "solid" "violet")
     (snowman snowman-top)
     (pillar state)))

(define
 (snowman drawing snowman-top)
 (~>
  (place-image/align
   (circle 20 "solid" "light gray")
   (- snowman-left 10) (+ snowman-top 20) "left" "top" drawing)
  (place-image/align
   (circle 10 "solid" "white")
   snowman-left snowman-top "left" "top" _)))

(define
 (pillar drawing state)
 (define pillar-left (game-state-pillar-left state))
 (define pillar-height (game-state-pillar-height state))
 (~>
  (place-image/align
   (rectangle 40 pillar-height "solid" "green")
   pillar-left 0 "left" "top" drawing)
  (place-image/align
   (rectangle 40 (- height-playground pillar-height pillar-opening)
                "solid" "yellow")
   pillar-left (+ pillar-height pillar-opening) "left" "top" _)))

(define (end? state) (>= (game-state-snowman-top state) (- 300 60)))

(define (keypress state key)
        (printf "~a~n" key)
        (define pillar-left (game-state-pillar-left state))
        (define snowman-top (game-state-snowman-top state))
        (define pillar-height (game-state-pillar-height state))
        (match key
               [(== "up") (game-state pillar-left pillar-height (- snowman-top 30))] 
               [else state]))

(define (ticker state)
        (game-state (sub1 (game-state-pillar-left state))
                (game-state-pillar-height state)
                (add1 (game-state-snowman-top state))))

(big-bang (game-state 350 40 110)
          (on-tick ticker)
          (on-draw draw-game)
          (stop-when end?)
          (on-key keypress))
