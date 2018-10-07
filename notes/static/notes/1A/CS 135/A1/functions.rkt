;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;;*****************************************************************************
;; CS 135 Section 008 Fall 2018
;; 2018-09-16
;; Simon Liu | 20765498
;; 
;; Assignment 1
;; Question 2
;;*****************************************************************************
;;

;; a) volume of a cone
(define (volume r h)
  (* (/ 1 3) pi (sqr r) h))

;; b) escape speed
(define G 6.674e-11)
(define (escape M r)
  (sqrt (/ (* 2 G M) r)))

;; c) Stirling's approximation
(define (Stirling n)
  (* (sqrt (* 2 pi n)) (expt (/ n e) n)))

;; d) monthly payment
(define (payment P r n)
  (* P (/ (* r (expt (+ 1 r) n)) (+ (expt (+ 1 r) n) 1))))

;; e) partition size approx.
(define (partition-size-approximation n)
  (*
   (/ 1 (* 4 n (sqrt 3)))
   (exp (* pi (sqrt (/ (* 2 n) 3))))))