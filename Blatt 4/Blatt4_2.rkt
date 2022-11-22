;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Blatt4_2) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ())))
; Aufgabe 2a: Daten- und Recorddefinitionen

; Eine Position (position) bestehend aus:
; - X Coordinate (position-x)
; - Y Coordinate (position-y)
(: make-position (natural natural -> position))
(define-record position
  make-position
  position?
  (position-x natural)
  (position-y natural))

; Eine Blume (flower) bestehend aus:
; - Namen (name)
; - Wasserbestand (water)
; - Position (position)
(: make-flower (string natural position -> flower))
(define-record flower
  make-flower
  flower?
  (flower-name string)
  (flower-water natural)
  (flower-position position))

; Ein Sprinkler (sprinkler) bestehend aus:
; - Reichweite (range)
; - Effektivität (effectivity)
(: make-sprinkler (natural real -> sprinkler))
(define-record sprinkler
  make-sprinkler
  sprinkler?
  (range natural)
  (effectivity real))
  
; Positionierung eines beliebigen Rasensprengers (placement) bestehend aus:
; - sprinkler
; - X Coordinate
; - Y Coordinate
(: make-placement (sprinkler natural natural -> placement))
(define-record placement
  make-placement
  placement?
  (placement-sprinkler sprinkler)
  (placement-x natural)
  (placement-y natural))

; Aufgabe 2b: Distanzberechnung

(: euclidean-distance (position position -> real))
(define euclidean-distance
  (lambda (distance1 distance2)
    (sqrt (+ (expt (- (position-x position1) (position-x position2)) 2) (expt (- (position-y position1) (position-y position2)) 2)))))