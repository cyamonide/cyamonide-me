;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname complexmath) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; *****************************************
;; Simon Liu (20765498)
;; CS 135 Fall 2018
;; Assignment 03, Question 2
;; *****************************************
;;

;; ==== Question 2a ========================

;; (posn-mult pos1 pos2) multiplies two positions and produces a posn as
;;  the product
;; posn-mult: Posn Posn -> Posn
;; Examples:
(check-expect (posn-mult (make-posn 1 3) (make-posn 4 2)) (make-posn -2 14))

(define (posn-mult pos1 pos2)
  (make-posn
   (- (* (posn-x pos1) (posn-x pos2))
      (* (posn-y pos1) (posn-y pos2)))
   (+ (* (posn-x pos1) (posn-y pos2))
      (* (posn-x pos2) (posn-y pos1)))))

;; Tests:
(check-expect (posn-mult (make-posn 0 3) (make-posn 4 0)) (make-posn 0 12))
(check-expect (posn-mult (make-posn 0 0) (make-posn 0 0)) (make-posn 0 0))
(check-expect (posn-mult (make-posn -2 3) (make-posn 4 -7)) (make-posn 13 26))

;; ==== Question 2b ========================

;; (posn-div pos1 pos2) divides two positions and produces a posn as
;;  the quotient
;; posn-mult: Posn Posn -> Posn
;; requires: x, y != 0
;; Examples:
(check-expect (posn-div (make-posn 1 3) (make-posn 4 2)) (make-posn 0.5 0.5))

(define (posn-div pos1 pos2)
  (make-posn
   (/ (+ (* (posn-x pos1) (posn-x pos2))
         (* (posn-y pos1) (posn-y pos2)))
      (+ (sqr (posn-x pos2))
         (sqr (posn-y pos2))))
   (/ (- (* (posn-y pos1) (posn-x pos2))
         (* (posn-x pos1) (posn-y pos2)))
      (+ (sqr (posn-x pos2))
         (sqr (posn-y pos2))))))

;; Tests:
(check-expect (posn-div (make-posn 1 1) (make-posn 1 1)) (make-posn 1 0))
(check-expect (posn-div (make-posn 3 3) (make-posn 3 3)) (make-posn 1 0))

;; ==== Question 2c ========================

;; (posn-reciprocal pos) takes a position and computes its reciprocal
;; posn-reciprocal Posn Posn -> Posn
;; requires: x, y != 0
;; Examples:
(check-expect (posn-reciprocal (make-posn 1 2)) (make-posn 0.2 -0.4))

(define (posn-reciprocal pos)
  (make-posn
   (/ (posn-x pos) (+ (sqr (posn-x pos)) (sqr (posn-y pos))))
   (- (/ (posn-y pos) (+ (sqr (posn-x pos)) (sqr (posn-y pos)))))))

;; Tests:
(check-expect (posn-reciprocal (make-posn 1 3)) (make-posn 0.1 -0.3))
(check-expect (posn-reciprocal (make-posn 4 2)) (make-posn 0.2 -0.1))