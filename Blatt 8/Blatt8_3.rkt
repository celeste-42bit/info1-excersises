;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname Blatt8_3) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Assignment 3 - Transpose

(: transpose ((list-of (list-of %a)) -> (list-of (list-of %a))))
(check-expect (transpose (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
              (list (list 1 4 7) (list 2 5 8) (list 3 6 9)))
(check-expect (transpose (list (list 1 2 3))) (list (list 1) (list 2) (list 3)))
(check-expect (transpose (list (list))) (list))
(check-expect (transpose (list)) (list))
(define transpose
  (lambda (xss)
    (match xss
      (empty empty)
      ((cons empty _) empty)
      ((cons y ys) (cons (map first xss) (transpose (map rest xss)))))))