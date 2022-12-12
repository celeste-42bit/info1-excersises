;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname Blatt7_2) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Assignment 2 a
#| "This function adds all elemetns of a list and returns the sum as a number |#

(: sum ((list-of number) -> number))
(check-expect (sum (list 21 21)) 42) ; of course this works... I used 42 to test it ¯\_(ツ)_/¯
(check-expect (sum (list 42))    42)
(check-expect (sum (list))        0)
(define sum
  (lambda (xs)
    (cond ; i know, pattern matching also works... <3 code diversity :P
      ((empty? xs) 0)
      ((cons? xs)  (+ (first xs) (sum (rest xs)))))))


; Assignment 2 b
#| "This function recursively multiplies all elements of a list with a multiplier
    and returns the product as a list" (At least it should, lol) |#

(: mult (number (list-of number) -> (list-of number)))
(check-expect (mult 42 (list 1 2 42)) (list 42 84 1764))
(check-expect (mult 42 (list 1)) (list 42))
(check-expect (mult 42 (list)) (list))
(define mult
  (lambda (x xs)
    (match xs
      (empty (list))
      ((cons y ys) (cons (* x y) (mult x ys))))))

; Assignment 2 c
#| "This funtion takes a list and cuts off n elements beginning from index 0" |#

(: drop (natural (list-of %a) -> (list-of %a)))
(check-expect (drop 3 (list "Thanks" "for all" "the" "fish")) (list "fish"))
(check-expect (drop 0 (list "42" "69")) (list "42" "69"))
(check-expect (drop 42 (list "Too" "Short")) (list))
(define drop
  (lambda (n xs)
    (cond
      ((= n 0) xs)
      (else
       (match xs
         (empty (list))
         ((cons y ys) (drop (- n 1) ys)))))))

; Assignment 2 d
#| "This function returns every n-th index of a list" |#
(: every-nth (natural (list-of %a) -> (list-of %a)))
(check-expect (every-nth 1 (list 1 2 3)) (list 1 2 3))
(check-expect (every-nth 2 (list 5 4 3 2 1)) (list 5 3 1))
(check-expect (every-nth 1 empty) empty)
(check-expect (every-nth 0 (list"a" "b" "c")) empty)
(define every-nth
  (lambda (n xs)
    (cond
      ((= n 0) empty)
      (else
       (match xs
         (empty empty)
         ((cons y ys) (cons y (every-nth n (drop (- n 1) ys)))))))))

; Assignment 2 e
#| "This should have been a signature for a list with 13 elements, but I didn't manage to find out how that works" |#

; Assignment 2 f
#| "The final check-isbn function which uses every-nth, mult and sum to validate ISBN's" |#

(: check-isbn ((list-of natural) -> boolean))
(check-expect (check-isbn (list 9 7 8 3 8 3 5 1 0 1 5 5 5)) #t) ; Die Macht der Abstraktion
(check-expect (check-isbn (list 9 7 8 0 3 4 5 3 4 1 4 6 4)) #t) ; Star Wars, Episode IV: A New Hope
(check-expect (check-isbn (list 9 7 8 3 5 2 8 6 6 4 4 2 8)) #t) ; Das ist o.B.d.A. trivial!
(define check-isbn
  (lambda (isbn)
    (= 0 (modulo
          (+ (sum (mult 3 (every-nth 2 (rest isbn)) )) ; rest isbn shifts the grid, so it only gets evens
             (sum (every-nth 2 isbn))) 10))))
  
