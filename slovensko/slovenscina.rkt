#lang racket

(require 2htdp/universe 2htdp/image)
(require match-plus)
(require alexis/util/struct)

(provide (rename-out
          [define naj-bo]
          [define/match naj-bo-ujemi]
          [let postavi]
          [match ujemi]
          [match-let ujemi-postavi]
          [identity identika]
          [printf izpiši]
          [apply uporabi]
          [first prvi]
          [rest ostalo]
          [empty? prazen?]
          [if če]
          [cond pogoj]
          [match če-je]
          [and in]
          [or ali]
          [ormap alimap]
          [andmap inmap]
          [list seznam]
          [quotient deli]
          [for/list za/seznam]
          [for/fold za/združi]
          [foldl združil]
          [else razen]
          [add1 dodaj1]
          [sub1 odstrani1]
          [max maks]
          [filter filtriraj]
          [set! postavi!]
          [string-append tekst-dodaj]
         ;; non-stdlib
          [define/match* naj-bo-ujemi*]
          [define-struct-updaters naj-bodo-struct-pomočniki]
         ;; htdp
          [big-bang big-bang]
          [to-draw za-risati]
          [on-tick tikataka]
          [on-key na-tipko]
          [stop-when ustavi-ko]
          [place-image postavi-sliko]
          [place-image/align postavi-sliko/poravnaj]
          [freeze zrmzuj]
          [overlay riši-nad]
          [underlay riši-pod]
          [polygon poligon]
          [rectangle pravokotnik]
          [circle krog])
         levo desno vrh dno gor dol
         enobarvno prozorno rob
         rdeče modro zeleno rumeno
         oranžno črno belo sivo
         temno-sivo svetlo-sivo
         violično roza)

(define levo "left")
(define desno "right")
(define gor "up")
(define dol "down")
(define vrh "top")
(define dno "bottom")
(define enobarvno "solid")
(define prozorno "transparent")
(define rob "outline")

(define rdeče "red")
(define modro "blue")
(define zeleno "green")
(define rumeno "yellow")
(define oranžno "orange")
(define violično "violet")
(define roza "pink")
(define črno "black")
(define belo "white")
(define sivo "gray")
(define temno-sivo "dark gray")
(define svetlo-sivo "light gray")
