;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname score) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; *****************************************
;; Simon Liu (20765498)
;; CS 135 Fall 2018
;; Assignment 02, Question 1
;; *****************************************
;;

;; Base scores (scores for level 0)
(define base-score-1-line 40)
(define base-score-2-lines 100)
(define base-score-3-lines 300)
(define base-score-4-lines 1200)

;; (tetris-score level lines-cleared) produces the number of points scored for 
;;   clearing lines-cleared lines at the given level.
;; tetris-score: Int Int -> Int
;; requires: level must be a non-negative integer
;;           1 <= lines-cleared <= 4 to score points
;; Examples:
(check-expect (tetris-score 0 1) 40)
(check-expect (tetris-score 1 2) 200)
(check-expect (tetris-score 19 2) 2000)
(check-expect (tetris-score 19 6) 0)

(define (tetris-score level lines-cleared)
  (cond
    [(= lines-cleared 1) (* base-score-1-line (+ level 1))]
    [(= lines-cleared 2) (* base-score-2-lines (+ level 1))]
    [(= lines-cleared 3) (* base-score-3-lines (+ level 1))]
    [(= lines-cleared 4) (* base-score-4-lines (+ level 1))]
    [else 0]))

;; Tests:
(check-expect (tetris-score 0 5) 0)
(check-expect (tetris-score 0 10) 0)
(check-expect (tetris-score 1 0) 0)
(check-expect (tetris-score 10 4) 13200)
(check-expect (tetris-score 0 4) 1200)
(check-expect (tetris-score 10 1) 440)
(check-expect (tetris-score 9 3) 3000)