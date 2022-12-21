;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname Blatt8_2) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Assignment 2a - 'foldl'
(: foldl (%b (%b %a -> %b) (list-of %a) -> %b))
(check-expect (foldl 0 (lambda (n d) (+ (* 10 n) d)) (list 1 0 2 4)) 1024)
(check-expect (foldl 0 (lambda (n d) (+ (* 10 n) d)) (list)) 0)
(define foldl
  (lambda (z c xs)
    (match xs
      (empty z)
      ((cons y ys) (foldl (c z y) c ys)))))

; Assignment 2b - Implementation of 'reverse' using 'foldl'
(: my-reverse ((list-of %a) -> (list-of %a)))
(check-expect (my-reverse (list 1 2 3 42)) (list 42 3 2 1))
(check-expect (my-reverse (list "two" "fourty")) (list "fourty" "two"))
(check-expect (my-reverse (list "lonely")) (list "lonely"))
(check-expect (my-reverse (list)) (list))
(define my-reverse
  (lambda (xs)
    (foldl empty (lambda (a b) (cons b a)) xs))) ; just flip the elements