;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "vanilla-reader.rkt" "deinprogramm" "sdp")((modname Blatt9_1) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Assignment 1

; Input & Tests
(: walls (list-of natural))
(define walls (list 1 8 6 2 5 4 8 3 7))  ; predefined walls from the sheet

#| (check-expect (max-volume walls) 49) |#

; a) Function max-volume
(: max-volume ((list-of natural) -> natural))
(define max-volume
  (lambda (walls) ...))