;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname design_recipe) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

;; here is the notes for lists

introducing lists:
  - useful for representing fixed amount of data
  - but there are many circumstances in which the amount of data
    is unbound, it could shrink or grow - you dont know by how much

  - list is a recursive structure - it is defined in terms of a smaller list

  - basic contructs
      empty: value representing list with 0 items
      cons:  consumes an item and a list and produces a new, longer list.
             item can be any

      first: consumes a nonempty list and produces the first item
      rest:  consumes a nonempty list and produces the same list without
             the first item

      empty?: consumes a value and produces true if it is empty and
              false otherwise

      cons?: consumes a value and produces true if it is a cons value and
             false otherwise

    ex:

    (define list-item 42)
    (define another-item 127)

    (define my-list (cons an-item-empty))

    (define my-longer-list (cons another-item my-list))

    my-longer-list
    (first my-longer-list)

    output: 127

  - list data definition
      - informally: a list is either empty, or consists
        of a first value followed by a list (the rest of the list)
      - a list is one of:
          - empty
          - (cons Any list)
      - this is a recursive definition, with a base case

  - Nested boxes visualization
      - cons can be thought of as producing a two-field structure.
        it can be visualized in two ways
      - [first][rest [first [rest [...]]]] not a good visualization, but correct
      - [first sonata arctica][rest -]-> [some other box]

  - some code:
    (define concerts
      (cons "amon amarth" (cons "blind guardian" (cons "sonata arctica" empty))))

      (first concerts) output: "Amon Amarth"

  - notation in contracts
      - well use (listof X) in contracts, where X may be replaced with any type
      - (listof Num), (listof Bool), (listof (anyof Num Sym)), (listof Any)
      - (list of X) is one of:
         empty
         (const list type)

  - Semantics of list functions
      - (cons a b) is a value
          - a must be a value
          - there are no restructions on the values of the first argument,
            allowing us to mix data types in a list
          - b must be a list (empty is a list)
          - like the values 1, "waterboy", and (make-posn 1 5),
            (cons a b) will not be simplified

  - substitution rules for first, rest, and empty? are:
      - (first (cons a b)) => a, where a and b are values
      - (rest (cons a b)) => b, where a and b are values
      - (empty? empty) => true
      - (empty? a) => false

  - ex: ;;n! = n * (n -1)!
        ;;1! = 1

        (define (factorial n)
          (cond [(<= a 1) 1]
                [else (* n factorial (- n 1))]))
  - ex:
        (define numbers (cons 4 (cons 3 (cons 2 (cons 1 empty)))))

        (define (factorial-list l)
          (cond [(empty? 1) STOP]
                [else (= (first 1) (fractorial-list (rest l)))]))

        (factorial-list numbers)

  - listof-string-template (listof Str) -> Any

  (define (listof-str-template los)
     (cond [(empty? los) ...]
           [else ... (first los) ...
                 ... (listof-str-template (rest los) ...)]))

  - complex example:
  (define-struct person (name height))
  (define-adrian (make-person "Adrian" 1.85))
  (define-adrian-mom (make-person "Adrian's mom" 1.67))
  (define-adrian-brother (make-person "Adrian's brother" 1.8499))

  (define family (cons adrians-mom (cons adrians-brother (cons adrian empty))))

  (define (tallest family)
     (cond [(empty? family) STOP]
           [else (max (person-height (first family))
                 (tallest (rest family)))]))
