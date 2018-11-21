;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2018-09-27-2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Models grunt unit
(define-struct unit-grunt (hp))

;; Models mage unit
(define-struct unit-mage (hp heal))

(define (can-defeat? my-unit other-unit)
  (cond
    [(>= (unit-grunt-hp my-unit) (unit-grunt-hp other-unit)) true]
    [else false]
    )
  )

;; stuff