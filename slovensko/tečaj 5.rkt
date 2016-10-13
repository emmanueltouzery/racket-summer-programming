#lang racket

(require "slovenscina.rkt")
(require threading)

(struct stanje (položaj-levo položaj-vrh) #:transparent)

(naj-bo
 (riši-igro stan)
 (izpiši "~a~n" stan)
 (naj-bo položaj-levo (stanje-položaj-levo stan))
 (naj-bo položaj-vrh (stanje-položaj-vrh stan))
 (~> (pravokotnik 500 300 enobarvno violično)
     (sneženi-mož položaj-levo položaj-vrh)
     (steber stan)))

(naj-bo
 (sneženi-mož risba položaj-levo položaj-vrh)
 (~>
  (postavi-sliko/poravnaj
   (krog 20 enobarvno svetlo-sivo)
   (- položaj-levo 10) (+ položaj-vrh 20) levo vrh risba)
  (postavi-sliko/poravnaj
   (krog 10 enobarvno belo)
   položaj-levo položaj-vrh levo vrh _)))

(naj-bo
 (steber risba stan)
 (~>
  (postavi-sliko/poravnaj
   (pravokotnik  40 100 enobarvno zeleno) 0 0 levo vrh risba)
  (postavi-sliko/poravnaj
   (pravokotnik  40 80 enobarvno rumeno) 0 220 levo vrh _)))

(naj-bo (konec? stan) (>= (stanje-položaj-vrh stan) (- 300 60)))

(naj-bo (pritisnil stan tipka)
        (izpiši "~a~n" tipka)
        (naj-bo položaj-levo (stanje-položaj-levo stan))
        (naj-bo položaj-vrh (stanje-položaj-vrh stan))
        (če-je tipka
               [(== gor) (stanje položaj-levo (- položaj-vrh  10))]  
               [(== dol) (stanje položaj-levo (+ 10 položaj-vrh))]  
               [(== desno) (stanje (+  10 položaj-levo) položaj-vrh)]
               [(== levo) (stanje (-  položaj-levo 10) položaj-vrh)]
               [razen stan]))

(naj-bo (na-tika stan)
        (stanje (stanje-položaj-levo stan)
                (dodaj1 (stanje-položaj-vrh stan))))

(big-bang (stanje 240  110)
          (tikataka na-tika)
          (za-risati riši-igro)
          (ustavi-ko konec?)
          (na-tipko pritisnil))
