;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2018-09-27) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; Resource is a (make-resource Nat Nat) container to keep track of
;;  in-game resources.
(define-struct resource (gold food))

;; resource-template
;; Resource -> Any
(define (resource-templtae res)
  ( ... (resource-gold res) ...
        ... (resource-food res) ...
        )
  )

;; Resource in my vault
(define my-vault (make-resource 5000 100))

;; Resource required to built a grunt
(define req-grunt (make-resource 200 3))

; ;Resource required to build a mage
(define req-mage (make-resource 500 2))

;; Purpose
;; (how-many-grunts) tells me how many grunts I aan train given my resources

;; Contract
;; Resource -> Num
(define (how-many-units resources req-units)
  (min
   (floor (/ (resource-gold resources) (resource-gold req-units)))
   (floor (/ (resource-food resources) (resource-food req-units)))
   )
  )

(check-expect (how-many-units my-vault req-grunt) 25)
(check-expect (how-many-units my-vault req-mage) 10)

;; Contract
;; Resource Num -> Resource
(define (add-gold resources amount)
  (make-resource
   (resource-gold resources) ; gold
   (resource-food resources) ; food
   )
  )