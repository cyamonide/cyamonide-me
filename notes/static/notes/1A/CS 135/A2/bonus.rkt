;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname bonus) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; *****************************************
;; Simon Liu (20765498)
;; CS 135 Fall 2018
;; Assignment 02, Bonus question
;; *****************************************
;;

;; ==== Bonus question ========================

;; day of the week
;; Jan 1 1753 is a monday
;; day is the number of days after Jan 1 1753

(define (day-of-the-week? days)
  (cond
    [(= 0 (modulo days 7)) 'Sunday]
    [(= 1 (modulo days 7)) 'Monday]
    [(= 2 (modulo days 7)) 'Tuesday]
    [(= 3 (modulo days 7)) 'Wednesday]
    [(= 4 (modulo days 7)) 'Thursday]
    [(= 5 (modulo days 7)) 'Friday]
    [(= 6 (modulo days 7)) 'Saturday]))

;; extracts years after 1752 (leap year)
(define (get-years date)
  (- (quotient date 10000) 1752))

;; returns month
(define (get-month date)
  (quotient (modulo date 10000) 100))

(get-month 17530101)
(get-month 17540501)
(get-month 17551101)

;; feb 29th
(define feb-29 229)

;; get number of leap days not counted
(define (leap-days date)
  (cond
    [(and
      (= 0 (modulo (get-years date) 4)) ;; if leap year and,
      (<= (modulo date 10000) feb-29))  ;; if feb 29 or before
     (- (- (+ (quotient (get-years date) 4) (quotient (get-years date) 400)) (quotient (get-years date) 100)) 1)] ;; 
    [else
     (- (+ (quotient (get-years date) 4) (quotient (get-years date) 400)) (quotient (get-years date) 100))]))

(leap-days 18680228)
(leap-days 18680229)

;; get number of days in full year
(define (full-years->days date)
  (* (- (get-years date) 1) 365))

(full-years->days 17530101)
(full-years->days 17540101)
(full-years->days 17550101)

;; get number of days in full months
(define (full-months->days date)
  (cond
    [(= (get-month date) 1) 0]
    [(= (get-month date) 2) 31]
    [(= (get-month date) 3) (+ 28 31)]
    [(= (get-month date) 4) (+ 28 (* 2 31))]
    [(= (get-month date) 5) (+ 28 30 (* 2 31))]
    [(= (get-month date) 6) (+ 28 30 (* 3 31))]
    [(= (get-month date) 7) (+ 28 (* 2 30) (* 3 31))]
    [(= (get-month date) 8) (+ 28 (* 2 30) (* 4 31))]
    [(= (get-month date) 9) (+ 28 (* 2 30) (* 5 31))]
    [(= (get-month date) 10) (+ 28 (* 3 30) (* 5 31))]
    [(= (get-month date) 11) (+ 28 (* 3 30) (* 6 31))]
    [(= (get-month date) 12) (+ 28 (* 4 30) (* 6 31))]))

true

(full-months->days 12340101)
(full-months->days 12340201)
(full-months->days 12340301)
(full-months->days 12340401)
(full-months->days 12340501)
(full-months->days 12340601)
(full-months->days 12340701)
(full-months->days 12340801)
(full-months->days 12340901)
(full-months->days 12341001)
(full-months->days 12341101)
(full-months->days 12341201)

(define (date->day-of-week date)
  (day-of-the-week?
   (+
    (full-years->days date)
    (leap-days date)
    (full-months->days date)
    (modulo date 100))))

(date->day-of-week 17530101)
(date->day-of-week 17540101)
(date->day-of-week 17550101)
(date->day-of-week 19000101)