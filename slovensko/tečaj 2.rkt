#lang racket

(require "slovenscina.rkt")
(require threading)

(naj-bo
 sneženi-mož
 (~> (pravokotnik 100 100 enobarvno modro)
     (postavi-sliko/poravnaj
      (krog 20 enobarvno belo) 30 60 levo vrh _)
     (postavi-sliko/poravnaj
      (krog 10 enobarvno belo) 40 40 levo vrh _)))

sneženi-mož