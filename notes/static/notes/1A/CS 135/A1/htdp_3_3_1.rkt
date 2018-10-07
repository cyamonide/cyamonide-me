;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname htdp_3_3_1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(define rate_inches->cm      2.54)
(define rate_feet->inches    12)
(define rate_yards->feet     3)
(define rate_rods->yards     (+ 5 (/ 1 2)))
(define rate_furlongs->rods  40)
(define rate_miles->furlongs 8)

(define (inches->cm x) (* x rate_inches->cm))
(define (feet->inches x) (* x rate_feet->inches))
(define (yards->feet x) (* x rate_yards->feet))
(define (rods->yards x) (* x rate_rods->yards))
(define (furlongs->rods x) (* x rate_furlongs->rods))
(define (miles->furlongs x) (* x rate_miles->furlongs))

(define (feet->cm x) (inches->cm (feet->inches x)))
(define (yards->cm x) (feet->cm (yards->feet x)))
(define (rods->inches x) (feet->inches (yards->feet (rods->yards x))))
(define (miles->feet x) (yards->feet (rods->yards (furlongs->rods (miles->furlongs x)))))

(inches->cm 1) "should be" 2.54
(inches->cm 3) "should be" 7.62

(feet->inches 1) "should be" 12
(feet->inches 3/2) "should be" 18

(yards->feet 1) "should be" 3
(yards->feet 12) "should be" 36

(rods->inches 1) "should be" 198
(rods->inches 3/2) "should be" 297

(furlongs->rods 1) "should be" 40
(furlongs->rods 7) "should be" 280

(miles->furlongs 1) "should be" 8
(miles->furlongs 10) "should be" 80

(feet->cm 1) "should be" 30.48
(feet->cm 4) "should be" 121.92

(yards->cm 1) "should be" 91.44
(yards->cm 2) "should be" 182.88

(rods->inches 1) "should be" 198
(rods->inches 3.5) "should be" 693

(miles->feet 1) "should be" 5280
(miles->feet 4) "should be" 21120