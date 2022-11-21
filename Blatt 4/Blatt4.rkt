;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Blatt4) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Ein Datum (calendar-date) besteht aus:
; - Tag
; - Monat
; - Jahr
(: make-calendar-date (natural natural natural -> calendar-date))
(define-record calendar-date
  make-calendar-date
  calendar-date-ok?
  (date-day natural)
  (date-month natural)
  (date-year natural))

(: calendar-date-ok? (calendar-date -> boolean))
(define claendar-date-ok?
  (lambda (my-date)
    (if (and ((date-day my-date) >= 1) ((date-day my-date) <= 31)) ; check day between 1-31
        (if (and ((date-month my-date) >= 1) ((date-month my-date) <= 12)) ; check month between 1-12
            (if (and ((date-year my-date) >= 0) ((date-year my-date) <= 2023)) ; check year between 0-2023
                #t
                #f)
            #f)
        #f)))

(define my-date (make-calendar-date 132 11 2006)) ; test date (day month year)

my-date

; preliminary tests
(check-within (date-day my-date) 1 31)
(check-within (date-month my-date) 1 12)
(check-within (date-year my-date) 0 2023)

(calendar-date-ok? my-date)

; Aufgabe 2

(define-record sprinkler
  make-sprinkler
  sprinkler?
  (sprinkler-power real)
  (sprinkler-distance natural)
  (sprinkler-position (natural natural)))

(define-record flower
  make-flower
  flower?
  (flower-name string)
  (flower-waterlevel natural)
  (flower-position (natural natural)))
  