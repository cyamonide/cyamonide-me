;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname chess) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;;
;; *****************************************
;; Simon Liu (20765498)
;; CS 135 Fall 2018
;; Assignment 03, Question 3
;; *****************************************
;;

;; ==== Question 3a ========================

(define-struct square (row column))
;; A Square is a (make-square Nat Sym)
;; requires: 1 <= row <= 8
;;           column: (anyof 'a 'b 'c 'd 'e 'f 'g 'h)

;; square-template: Square -> Any
(define (square-template square)
  (... (square-row square)
       (square-column square) ...))

(define-struct piece (pos unit))
;; A Piece is a (make-piece Square Sym)
;; requires: unit: (anyof 'knight 'rook 'bishop 'queen)

;; ==== Question 3b ========================

;; my-piece-fn: Piece -> Any
(define (my-piece-fn piece)
  (... (piece-pos piece)
       (piece-unit piece) ...))

;; ==== Question 3c ========================

;; (column->number column) takes a column and returns a number, effectively
;;   enumerating the possible columns 'a to 'h with 1 - 8
;; column->number: Sym -> Nat
;; Examples:
(check-expect (column->number 'a) 1)
(check-expect (column->number 'e) 5)
(check-expect (column->number 'b) 2)

(define (column->number column)
  (cond [(symbol=? column 'a) 1]
        [(symbol=? column 'b) 2]
        [(symbol=? column 'c) 3]
        [(symbol=? column 'd) 4]
        [(symbol=? column 'e) 5]
        [(symbol=? column 'f) 6]
        [(symbol=? column 'g) 7]
        [(symbol=? column 'h) 8]))


;; (number->column number) takes a number and returns its corresponding column,
;;   mapping 1 - 8 to columns 'a - 'h 
;; number->column: Nat -> Sym
;; Examples:
(check-expect (number->column 1) 'a)
(check-expect (number->column 5) 'e)
(check-expect (number->column 2) 'b)
(check-expect (number->column 8) 'h)

(define (number->column number)
  (cond [(= number 1) 'a]
        [(= number 2) 'b]
        [(= number 3) 'c]
        [(= number 4) 'd]
        [(= number 5) 'e]
        [(= number 6) 'f]
        [(= number 7) 'g]
        [(= number 8) 'h]))


;; (delta-col square1 square2) computes the absolute value of the distance
;;   between the column of square1 and the column of square2
;; delta-col: Square Square -> Nat
;; Example:
(check-expect (delta-col (make-square 3 'c) (make-square 2 'f)) 3)

(define (delta-col square1 square2)
  (abs (- (column->number (square-column square1))
          (column->number (square-column square2)))))


;; (delta-row square1 square2) computes the absolute value of the distance
;;   between the row of square1 and the row of square2
;; delta-row: Square Square -> Nat
;; Example:
(check-expect (delta-row (make-square 3 'c) (make-square 2 'f)) 1)

(define (delta-row square1 square2)
  (abs (- (square-row square1)
          (square-row square2))))


;; (valid-move? piece square) takes a piece and computes whether square is a
;;   valid move for the type of piece provided
;; valid-move?: Piece Square -> Bool
;; Examples:
(check-expect (valid-move? (make-piece (make-square 4 'e) 'knight) (make-square 6 'd)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'rook) (make-square 5 'h)) false)

(define (valid-move? piece square)
  (cond [(and (= (delta-col (piece-pos piece) square) 0)
              (= (delta-row (piece-pos piece) square) 0))
         true]
        [(symbol=? (piece-unit piece) 'knight)
         (or (and (= (delta-col (piece-pos piece) square) 2)
                  (= (delta-row (piece-pos piece) square) 1))
             (and (= (delta-col (piece-pos piece) square) 1)
                  (= (delta-row (piece-pos piece) square) 2)))]
        [(symbol=? (piece-unit piece) 'rook)
         (or (= (delta-col (piece-pos piece) square) 0)
             (= (delta-row (piece-pos piece) square) 0))]
        [(symbol=? (piece-unit piece) 'bishop)
         (= (delta-col (piece-pos piece) square)
            (delta-row (piece-pos piece) square))]
        [(symbol=? (piece-unit piece) 'queen)
         (or (or (= (delta-col (piece-pos piece) square) 0)
                 (= (delta-row (piece-pos piece) square) 0))
             (= (delta-col (piece-pos piece) square)
                (delta-row (piece-pos piece) square)))]
        [else false])) ; shouldn't execute if Piece contract obeyed

;; Tests:
;; Knight tests:
(check-expect (valid-move? (make-piece (make-square 4 'e) 'knight) (make-square 6 'f)) true)
(check-expect (valid-move? (make-piece (make-square 4 'e) 'knight) (make-square 5 'g)) true)
(check-expect (valid-move? (make-piece (make-square 4 'e) 'knight) (make-square 2 'd)) true)
(check-expect (valid-move? (make-piece (make-square 4 'e) 'knight) (make-square 2 'e)) false)
;; Rook tests
(check-expect (valid-move? (make-piece (make-square 3 'c) 'rook) (make-square 3 'c)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'rook) (make-square 7 'c)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'rook) (make-square 3 'h)) true)
;; Bisohp tests
(check-expect (valid-move? (make-piece (make-square 3 'c) 'bishop) (make-square 3 'c)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'bishop) (make-square 5 'e)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'bishop) (make-square 5 'a)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'bishop) (make-square 5 'h)) false)
;; Queen tests
(check-expect (valid-move? (make-piece (make-square 3 'c) 'queen) (make-square 3 'c)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'queen) (make-square 7 'c)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'queen) (make-square 3 'h)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'queen) (make-square 3 'c)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'queen) (make-square 5 'e)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'queen) (make-square 5 'a)) true)
(check-expect (valid-move? (make-piece (make-square 3 'c) 'queen) (make-square 5 'h)) false)


;; ==== Question 3d ========================

;; Observe the following chessboard illustrating Manhattan distances from
;;  square H1 for all squares on the board.
;; 
;; 8 | 14 13 12 11 10  9  8  7
;; 7 | 13 12 11 10  9  8  7  6
;; 6 | 12 11 10  9  8  7  6  5
;; 5 | 11 10  9  8  7  6  5  4
;; 4 | 10  9  8  7  6  5  4  3
;; 3 |  9  8  7  6  5  4  3  2
;; 2 |  8  7  6  5  4  3  2  1
;; 1 |  7  6  5  4  3  2  1  0
;;    --------------------------
;;      a  b  c  d  e  f  g  h
;;
;; Also, a knight's possible moves are as follows:
;;
;; |  -  x  -  x  -
;; |  x  -  -  - R1
;; |  -  -  K  -  -
;; |  x  -  -  - R2
;; |  - D1  - D2  -
;;  -----------------
;;
;; Notice that movements to only R1, R2, D1, and D2 (if possible) lower the
;;  Manhattan distance from h1. Note that moves D1 and D2 should not be
;;  confused with the squares d1 and d2
;;
;; Based on these observations, we can determine the optimal next move
;;  as follows (implemented using cond):
;;
;; No move | (column = g or h) and (row = 1 or 2)
;; D1      | column = h
;; R1      | row = 1
;; R2      | row = 2
;; D2      | otherwise
;;


;; (knight-move-D1 square) takes a knight's current Square and computes
;;   its new location if it were to move D1
;; knight-move-D1: Square -> Square
;; Example:
(check-expect (knight-move-D1 (make-square 4 'd)) (make-square 2 'c))

(define (knight-move-D1 square)
  (make-square (- (square-row square) 2)
               (number->column
                (- (column->number (square-column square)) 1))))


;; (knight-move-D2 square) takes a knight's current Square and computes
;;   its new location if it were to move D2
;; knight-move-D2: Square -> Square
;; Example:
(check-expect (knight-move-D2 (make-square 4 'd)) (make-square 2 'e))

(define (knight-move-D2 square)
  (make-square (- (square-row square) 2)
               (number->column
                (+ (column->number (square-column square)) 1))))


;; (knight-move-R1 square) takes a knight's current Square and computes
;;   its new location if it were to move R1
;; knight-move-R1: Square -> Square
;; Example:
(check-expect (knight-move-R1 (make-square 4 'd)) (make-square 5 'f))

(define (knight-move-R1 square)
  (make-square (+ (square-row square) 1)
               (number->column
                (+ (column->number (square-column square)) 2))))


;; (knight-move-R2 square) takes a knight's current Square and computes
;;   its new location if it were to move R2
;; knight-move-R2: Square -> Square
;; Example:
(check-expect (knight-move-R2 (make-square 4 'd)) (make-square 3 'f))

(define (knight-move-R2 square)
  (make-square (- (square-row square) 1)
               (number->column
                (+ (column->number (square-column square)) 2))))

;; (knight-next-move piece) takes a piece of unit 'knight and computes
;;   the next move based on a specific policy, moving it closer to h1
;; knight-next-move: Piece -> Square
;; requires: (piece-unit piece) must be 'knight
;; Example:
(check-expect (knight-next-move (make-piece (make-square 2 'c) 'knight))
              (make-square 1 'e))

(define (knight-next-move piece)
  (cond [(and (or (= (square-row (piece-pos piece)) 1)
                  (= (square-row (piece-pos piece)) 1))
              (or (symbol=? (square-column (piece-pos piece)) 'g)
                  (symbol=? (square-column (piece-pos piece)) 'h)))
          (piece-pos piece)]
        [(symbol=? (square-column (piece-pos piece)) 'h)
         (knight-move-D1 (piece-pos piece))]
        [(= (square-row (piece-pos piece)) 1)
         (knight-move-R1 (piece-pos piece))]
        [(= (square-row (piece-pos piece)) 2)
         (knight-move-R2 (piece-pos piece))]
        [else
         (knight-move-D2 (piece-pos piece))]))

;; Tests:
(check-expect (knight-next-move (make-piece (make-square 3 'h) 'knight))
              (make-square 1 'g))
(check-expect (knight-next-move (make-piece (make-square 5 'e) 'knight))
              (make-square 3 'f))
(check-expect (knight-next-move (make-piece (make-square 2 'e) 'knight))
              (make-square 1 'g))
(check-expect (knight-next-move (make-piece (make-square 1 'b) 'knight))
              (make-square 2 'd))
(check-expect (knight-next-move (make-piece (make-square 1 'h) 'knight))
              (make-square 1 'h))
