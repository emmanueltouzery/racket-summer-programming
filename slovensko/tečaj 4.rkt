#lang racket

(require "slovenscina.rkt")
(require threading)

(struct stanje (položaj-levo položaj-vrh) #:transparent)

(naj-bo
 (sneženi-mož stan)
 (naj-bo položaj-levo (stanje-položaj-levo stan))
 (naj-bo položaj-vrh (stanje-položaj-vrh stan))
 (~> (pravokotnik 500 300 enobarvno modro)
     (postavi-sliko/poravnaj
      (krog 20 enobarvno belo) (- položaj-levo 10) (+ položaj-vrh 20) levo vrh _)
     (postavi-sliko/poravnaj
      (krog 10 enobarvno belo) položaj-levo položaj-vrh levo vrh _)))

(naj-bo (konec? stan) (>= (stanje-položaj-vrh stan) (- 300 60)))

(naj-bo (pritisnil stan tipka)
        (izpiši "~a~n" tipka)
        (naj-bo položaj-levo (stanje-položaj-levo stan))
        (naj-bo položaj-vrh (stanje-položaj-vrh stan))
        (če-je tipka
               [(== gor) (stanje položaj-levo (- položaj-vrh 10))]
               [(== dol) (stanje položaj-levo (+ 10 položaj-vrh))]
               [(== levo) (stanje (- položaj-levo 10) položaj-vrh)]
               [(== desno) (stanje (+ položaj-levo 10) položaj-vrh)]
               [razen stan]))

(naj-bo (na-tika stan)
        (stanje (stanje-položaj-levo stan) (dodaj1 (stanje-položaj-vrh stan))))

(big-bang (stanje 250 0)
          (tikataka na-tika)
          (za-risati sneženi-mož)
          (ustavi-ko konec?)
          (na-tipko pritisnil))
