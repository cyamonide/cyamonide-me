;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname grades) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;;*****************************************************************************
;; CS 135 Section 008 Fall 2018
;; 2018-09-16
;; Simon Liu | 20765498
;; 
;; Assignment 1
;; Question 4
;;*****************************************************************************
;;

;; a) final grade calculation
(define (final-cs135-grade
         midterm-grade-1 midterm-grade-2 final-exam-grade overall-assign-grade)
  (/ (+
      (* 5 100) (* 10 midterm-grade-1) (* 20 midterm-grade-2)
      (* 45 final-exam-grade) (* 20 overall-assign-grade))
     100))

;; b) min final exam grade for passing grade
(define (cs135-final-exam-grade-needed
         midterm-grade-1 midterm-grade-2 overall-assign-grade)
  (/ (-
      (* 60 100)
      (+
       (* 5 100) (* 10 midterm-grade-1)
       (* 20 midterm-grade-2) (* 20 overall-assign-grade)))
     45))
  