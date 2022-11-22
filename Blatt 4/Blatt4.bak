;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Blatt4) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Ein Datum (calendar-date) besteht aus:
; - Tag
; - Monat
; - Jahr

(define-record calendar-date
  make-calendar-date
  calendar-date-ok?
  (date-day natural)
  (date-month natural)
  (date-year natural))

(: calendar-date-ok? record -> boolean)
(define claendar-date-ok?
  (lambda (c)
    ...
    