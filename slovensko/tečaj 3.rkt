#lang racket

(require "slovenscina.rkt")
(require threading)

(naj-bo
 (sneženi-mož položaj)
 (~> (pravokotnik 500 300 enobarvno modro)
     (postavi-sliko/poravnaj
      (krog 20 enobarvno belo) 240 (+ položaj 20) levo vrh _)
     (postavi-sliko/poravnaj
      (krog 10 enobarvno belo) 250 položaj levo vrh _)))

(naj-bo (konec? položaj) (>= položaj (- 300 60)))

(naj-bo (pritisnil položaj tipka)
        (izpiši "~a~n" tipka)
        (če-je tipka
               [(== gor) (izpiši "gor") (- položaj 10)]
               [(== dol) (+ položaj 10)]
               [razen položaj]))

(big-bang 0
          (tikataka dodaj1)
          (za-risati sneženi-mož)
          (ustavi-ko konec?)
          (na-tipko pritisnil))
