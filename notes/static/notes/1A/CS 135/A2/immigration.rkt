;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname immigration) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; *****************************************
;; Simon Liu (20876598)
;; CS 135 Fall 2018
;; Assignment 02, Question 2
;; *****************************************
;;


;; ==== Constants ==========================

;; Scores based on age
(define age-bracket-1-score 0) ; for ages less than 18 years
(define age-bracket-2-score 100) ; for ages between 20 and 29 years inclusive
(define age-bracket-3-score 0) ; for ages 49 years or older
;; for age ranges, see function (age-score age)

;; Scores based on education level
(define graduate-score 126)
(define undergraduate-score 112)
(define high-school-score 28)

;; Scores based on language proficiency
(define language-bracket-1-score 116) ; for language scores 9-10
(define language-bracket-2-score 88) ; for language score 8
(define language-bracket-3-score 64) ; for language score 7
(define language-bracket-4-score 0) ; for any other language score

;; Scores based on work experience
(define work-exp-bracket-1-score 0) ; for 0 years work experience
(define work-exp-bracket-2-score 35) ; for 1 year work experience
(define work-exp-bracket-3-score 56) ; for 2-3 years work experience
(define work-exp-bracket-4-score 70) ; for 4 or more years work experience

;; CEC eligibility cutoff
(define cec-eligibility-score 350)

;; ==== Question 2a ========================


;; (age-score age) calculates an immigration applicant's score =================
;;   based on age.
;; age-score Nat -> Nat
;; Examples:
(check-expect (age-score 17) 0)
(check-expect (age-score 18) 90)
(check-expect (age-score 22) 100)
(check-expect (age-score 32) 85)
(check-expect (age-score 67) 0)

(define (age-score age)
  (cond
    [(< age 18) age-bracket-1-score] ; age under 17
    [(< age 20) (* 5 age)] ; aged 18-19
    [(< age 30) age-bracket-2-score] ; aged 20-29
    [(< age 49) (* 5 (- 49 age))] ; age under 49
    [else age-bracket-3-score]))

;; Tests:
(check-expect (age-score 0) 0)
(check-expect (age-score 19) 95)
(check-expect (age-score 20) 100)
(check-expect (age-score 29) 100)
(check-expect (age-score 30) 95)
(check-expect (age-score 48) 5)
(check-expect (age-score 49) 0)


;; (education-score education) calculates an immigration applicant's score =====
;;   based on education.
;; education-score Symb -> Nat
;; Examples:
(check-expect (education-score 'graduate) 126)

(define (education-score education)
  (cond
    [(symbol=? education 'graduate) graduate-score]
    [(symbol=? education 'undergraduate) undergraduate-score]
    [(symbol=? education 'highschool) high-school-score]
    [else 0]))

;; Tests:
(check-expect (education-score 'undergraduate) 112)
(check-expect (education-score 'highschool) 28)
(check-expect (education-score 'someinvalidsymbol) 0)


;; (language-score language) calculates an immigration applicant's score =======
;;   based on language proficiency.
;; language-score Nat -> Nat
;; requires: 1 <= language <= 10
;; Examples:
(check-expect (language-score 3) 0)
(check-expect (language-score 9) 116)

(define (language-score language)
  (cond
    [(> language 8) language-bracket-1-score] ; 9 or higher
    [(= language 8) language-bracket-2-score]
    [(= language 7) language-bracket-3-score]
    [else language-bracket-4-score]))

;; Tests:
(check-expect (language-score 0) 0)
(check-expect (language-score 6) 0)
(check-expect (language-score 9) 116)
(check-expect (language-score 10) 116)
(check-expect (language-score 8) 88)
(check-expect (language-score 7) 64)


;; (work-exp-score work-exp) calculates an immigration applicant's score =======
;;   based on work experience.
;; work-exp-score Nat -> Nat
;; Examples:
(check-expect (work-exp-score 0) 0)
(check-expect (work-exp-score 2) 56)
(check-expect (work-exp-score 6) 70)

(define (work-exp-score work-exp)
  (cond
    [(= work-exp 0) work-exp-bracket-1-score]
    [(= work-exp 1) work-exp-bracket-2-score]
    [(< work-exp 4) work-exp-bracket-3-score] ; 2-3 years
    [else work-exp-bracket-4-score])) ; 4 years or more

;; Tests:
(check-expect (work-exp-score 1) 35)
(check-expect (work-exp-score 3) 56)
(check-expect (work-exp-score 4) 70)


;; (job-offer-score job-offer) calculates an immigration applicant's score =====
;;   based on whether they have a job offer
;; job-offer-score Bool -> Nat
;; Examples:
(check-expect (job-offer-score false) 0)
(check-expect (job-offer-score true) 200)

(define (job-offer-score job-offer)
  (cond
    [job-offer 200]
    [else 0]))


;; (pr-cec-score age education language work-exp job-offer) ====================
;;   calculates an immigration applicant's score according to
;;   the Comprehensive Ranking system.
;; pr-cec-score Nat Symb Nat Nat Bool -> Nat
;; Examples:
(check-expect (pr-cec-score 22 'undergraduate 5 1 false) 247)

(define (pr-cec-score age education language work-exp job-offer)
  (+
   (age-score age)
   (education-score education)
   (language-score language)
   (work-exp-score work-exp)
   (job-offer-score job-offer)))

;; Tests: See also tests in helper functions
(check-expect (pr-cec-score 17 'highschool 5 0 false) 28)


;; ==== Question 2b ========================


;; (pr-cec-eligible? age education language work-exp job-offer) ================
;;   calculates if an immigration applicant is eligible for the CEC
;;   based on the Comprehensive Ranking system.
;; pr-cec-eligible? Nat Symb Nat Nat Bool -> Bool
;; Examples:
(check-expect (pr-cec-eligible? 22 'undergraduate 5 1 false) false)
(check-expect (pr-cec-eligible? 28 'graduate 9 2 false) true)

(define (pr-cec-eligible? age education language work-exp job-offer)
  (and
   (< 0 work-exp)
   (<= cec-eligibility-score (pr-cec-score age education language work-exp job-offer))))

;; Tests: See also tests in helper functions
(check-expect (pr-cec-eligible? 17 'highschool 5 0 false) false)