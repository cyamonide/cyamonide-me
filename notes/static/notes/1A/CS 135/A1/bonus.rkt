;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bonus) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;;*****************************************************************************
;; CS 135 Section 008 Fall 2018
;; 2018-09-16
;; Simon Liu | 20765498
;; 
;; Assignment 1
;; Question 5 (Bonus)
;;*****************************************************************************
;;

;; calculates participation mark
(define (cs135-participation
         questions-asked questions-correct questions-incorrect)
  (*
   (/
    (+
     ;; weighting of correct points
     (* 2 (min (* 0.75 questions-asked) questions-correct))
     ;; weighting of incorrect points
     (min
      (-
       (* 0.75 questions-asked)
       (min (* 0.75 questions-asked) questions-correct))
      questions-incorrect))
    ;; divide by top 75% of questions
    (* 0.75 2 questions-asked))
   ;; multiply by 100%
   100))

;; (check-expect (cs135-participation 12 0 3) (/ 300 18))
;; (check-expect (cs135-participation 12 6 4) (/ 1500 18))
;; (check-expect (cs135-participation 12 12 0) 100)
;; (check-expect (cs135-participation 12 9 2) 100)
;; (check-expect (cs135-participation 12 0 0) 0)