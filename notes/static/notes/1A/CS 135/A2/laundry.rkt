;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname laundry) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; *****************************************
;; Simon Liu (20765498)
;; CS 135 Fall 2018
;; Assignment 02, Question 3
;; *****************************************
;;

;; ==== Question 3a ========================

;; (acceptable-to-wear/cond? is-smelly clothing-type days) determines whether
;;   a clothing item in the hamper is acceptable to wear.
;; acceptable-to-wear/cond? Bool Symb Nat -> Bool
;; Examples:
(check-expect (acceptable-to-wear/cond? false 'shirt 8) true)
(check-expect (acceptable-to-wear/cond? true 'socks 2) false)

(define (acceptable-to-wear/cond? is-smelly clothing-type days)
  (cond
    [is-smelly false]
    [else (cond
            [(symbol=? clothing-type 'socks)
             (cond
               [(>= days 4) false]
               [else true])]
            [(symbol=? clothing-type 'shirt)
             (cond
               [(<= days 2) false]
               [(>= days 10) false]
               [else true])]
            [else true])]))

;; Tests:
(check-expect (acceptable-to-wear/cond? false 'socks 4) false)
(check-expect (acceptable-to-wear/cond? false 'socks 3) true)
(check-expect (acceptable-to-wear/cond? false 'shirt 1) false)
(check-expect (acceptable-to-wear/cond? false 'shirt 11) false)
(check-expect (acceptable-to-wear/cond? false 'shirt 5) true)
(check-expect (acceptable-to-wear/cond? false 'notashirt 5) true)


;; ==== Question 3b ========================

;; (acceptable-to-wear/bool? is-smelly clothing-type days) determines whether
;;   a clothing item in the hamper is acceptable to wear.
;; acceptable-to-wear/bool? Bool Symb Nat -> Bool
;; Examples:
(check-expect (acceptable-to-wear/bool? false 'shirt 8) true)
(check-expect (acceptable-to-wear/bool? true 'socks 2) false)

(define (acceptable-to-wear/bool? is-smelly clothing-type days)
  (not
   (or
    is-smelly
    (and (symbol=? clothing-type 'socks) (>= days 4))
    (and (symbol=? clothing-type 'shirt) (<= days 2))
    (and (symbol=? clothing-type 'shirt) (>= days 10)))))

;; Tests:
(check-expect (acceptable-to-wear/bool? false 'socks 4) false)
(check-expect (acceptable-to-wear/bool? false 'socks 3) true)
(check-expect (acceptable-to-wear/bool? false 'shirt 1) false)
(check-expect (acceptable-to-wear/bool? false 'shirt 11) false)
(check-expect (acceptable-to-wear/bool? false 'shirt 5) true)
(check-expect (acceptable-to-wear/bool? false 'notashirt 5) true)