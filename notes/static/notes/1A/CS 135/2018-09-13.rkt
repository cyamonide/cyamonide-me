;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2018-09-13) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Simon Liu / 2018-09-13 / Lecture 3

;; Purpose:
;; (how-many-beers time weight) produces the number of beers
;; I can drink (given my weight in kg) and be sober again
;; after some time (in hours).
;; Reference: Wikipedia ...

;; Examples:
;; beers = 0.015 * time * 0.5 * weight
(check-expect (how-many-beers 5 70) 2.625)

;; Contract:
;; (how-many-beers): Num Num -> Num

(define BodyWaterContent 0.5)
(define MetabolicRate 0.015) ; from the wiki, averaged over genders

(define (how-many-beers time weight) (
  *
    BodyWaterContent
    time
    MetabolicRate
    weight
  )
)

;; Tests

(how-many-beers 10 70)