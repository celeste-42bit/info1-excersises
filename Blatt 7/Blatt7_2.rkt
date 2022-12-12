;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname Blatt7_2) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Assignment 2 a
#| "This function adds all elemetns of a list and returns the sum as a number |#

(: sum ((list-of number) -> number))
(check-expect (sum (list 21 21)) 42) ; of course this works... I used 42 to test it ¯\_(ツ)_/¯
(check-expect (sum (list 42))    42) ; Hmmm 🤔 seems right?
(check-expect (sum (list))        0) ; empty, very empty
(define sum
  (lambda (xs)
    (cond
      ((empty? xs) 0) ; is it empty?
      ((cons? xs)  (+ (first xs) (sum (rest xs))))))) ; is it a cons-construct?


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

