;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Blatt5) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Aufgabe 2a

; Kreis
; - Radius
; - Farbe

(define-record geom-circle
  make-geom-circle
  (geom-circle-radius real)
  (geom-circle-color image-color))

; Rechteck
; - Breite
; - Höhe
; - Farbe

(define-record geom-rectangle
  make-geom-rectangle
  (geom-rectangle-width real)
  (geom-rectangle-hight real)
  (geom-rectangle-color image-color))

; Dreieck
; - Kantenlänge
; - Farbe

(define-record geom-triangle
  make-geom-triangle
  (geom-triangle-edgelength real)
  (geom-triangle-color image-color))
