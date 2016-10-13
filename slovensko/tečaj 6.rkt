#lang racket

(require "slovenscina.rkt")
(require threading)

(struct stanje (steber-levo višina-stebra mož-vrh) #:transparent)

(naj-bo mož-levo 100)
(naj-bo razmak-steber 100)
(naj-bo višina-igrišča 300)

(naj-bo
 (riši-igro stan)
 (izpiši "~a~n" stan)
 (naj-bo steber-levo (stanje-steber-levo stan))
 (naj-bo mož-vrh (stanje-mož-vrh stan))
 (~> (pravokotnik 500 višina-igrišča enobarvno violično)
     (sneženi-mož mož-vrh)
     (steber stan)))

(naj-bo
 (sneženi-mož risba mož-vrh)
 (~>
  (postavi-sliko/poravnaj
   (krog 20 enobarvno svetlo-sivo) (- mož-levo 10) (+ mož-vrh 20) levo vrh risba)
  (postavi-sliko/poravnaj
   (krog 10 enobarvno belo) mož-levo mož-vrh levo vrh _)))

(naj-bo
 (steber risba stan)
 (naj-bo steber-levo (stanje-steber-levo stan))
 (naj-bo višina-stebra (stanje-višina-stebra stan))
 (~>
  (postavi-sliko/poravnaj
   (pravokotnik 40 višina-stebra enobarvno zeleno)
   steber-levo 0 levo vrh risba)
  (postavi-sliko/poravnaj
   (pravokotnik 40 (- višina-igrišča višina-stebra razmak-steber)
                enobarvno rumeno)
   steber-levo (+ višina-stebra razmak-steber) levo vrh _)))

(naj-bo (konec? stan) (>= (stanje-mož-vrh stan) (- 300 60)))

(naj-bo (pritisnil stan tipka)
        (izpiši "~a~n" tipka)
        (naj-bo steber-levo (stanje-steber-levo stan))
        (naj-bo mož-vrh (stanje-mož-vrh stan))
        (naj-bo višina-stebra (stanje-višina-stebra stan))
        (če-je tipka
               [(== gor) (stanje steber-levo višina-stebra (- mož-vrh 30))] 
               [razen stan]))

(naj-bo (na-tika stan)
        (stanje (odstrani1 (stanje-steber-levo stan))
                (stanje-višina-stebra stan)
                (dodaj1 (stanje-mož-vrh stan))))

(big-bang (stanje 350 40 110)
          (tikataka na-tika)
          (za-risati riši-igro)
          (ustavi-ko konec?)
          (na-tipko pritisnil))
