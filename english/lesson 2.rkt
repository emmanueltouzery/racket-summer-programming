#lang racket

(require 2htdp/image)
(require threading)

(~> (rectangle 100 100 "solid" "blue")
    (place-image/align
     (circle 20 "solid" "white") 30 60 "left" "top" _)
    (place-image/align
     (circle 10 "solid" "white") 40 40 "left" "top" _))