;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname Blatt7_2) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Aufgabe 2 a "This function adds all elemetns of a list and returns the sum as a number

(: sum ((list-of number) -> number))
(check-expect (sum (list 21 21)) 42) ; of course this works... I used 42 to test it ¯\_(ツ)_/¯
(check-expect (sum (list)) 0) ; it's nothing, just an empty list ^^
(define sum
  (lambda (xs)
    (cond
      ((empty? xs) 0)
      ((cons? xs)  (+ (first xs) (sum (rest xs)))))))

; Aufgabe 2 b "xxx"

(: mult (number (list-of number) -> (list-of number)))

(define mult
  (lambda (x xs)
    (cond
      ((empty? xs) 0)
      ((cons? xs)  (* x (first xs))))))

(mult 3 (list))
