;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2018-09-20) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define req_tyres_min 4)
(define req_hp_min 150)
(define req_seats_min 2)
(define req_seats_sedan_max 5)
(define req_seats_van_max 8)

(define inv_tyres 5)
(define inv_engine 2)
(define inv_engine_hp 80)
(define want_seats 6)

(define (can-build-car? tyres engine engine_hp seats type)
  (and
   (>= tyres req_tyres_min) ; tyres
   (> (* engine engine_hp) req_hp_min) ;hp
   (>= seats req_seats_min) ;seat_min
   (or (and (symbol=? type 'sedan) (<= seats req_seats_sedan_max)) ;sedan
       (and (symbol=? type 'van) (<= seats req_seats_van_max)) ;van
       ) ;seat_max
   )
  )

(can-build-car? inv_tyres inv_engine inv_engine_hp want_seats 'van)