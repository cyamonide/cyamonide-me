;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname conversion) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;;*****************************************************************************
;; CS 135 Section 008 Fall 2018
;; 2018-09-16
;; Simon Liu | 20765498
;; 
;; Assignment 1
;; Question 3
;;*****************************************************************************
;;

;; conversion rate for miles to km (i.e. 1 mile = 1.609344 km)
(define rate-mile->km 1.609344)
;; conversion rate for gallons to litres
(define rate-gallon->l 3.785411784)

;; a) mpg to lp100km
(define (mpg->lp100km x)
  (* (/ 1 x) (/ rate-gallon->l rate-mile->km) 100))

;; conversion rate for thimbles to litres
(define rate-thimbles->l 0.0021)
;; conversion rate for chains to rods
(define rate-chains->rods 4)
;; conversion rate for rods to yards
(define rate-rods->yards 5.5)
;; conversion rate for miles to yards
(define rate-miles->yards 1760)

;; conversion rate for gallons to thimbles
(define rate-gallons->thimbles
  (* rate-gallon->l (/ 1 rate-thimbles->l)))

;; converts miles to chains
(define rate-miles->chains
  (* rate-miles->yards (/ 1 rate-rods->yards) (/ 1 rate-chains->rods)))

;; b) mpg to chains-per-thimble
(define (mpg->cpt x)
  (* x rate-miles->chains (/ 1 rate-gallons->thimbles)))
  