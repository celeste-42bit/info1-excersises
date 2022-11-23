;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Blatt4_2) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
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
  (sprinkler-range natural)
  (sprinkler-effectivity real))
  
; Positionierung eines beliebigen Rasensprengers (placement) bestehend aus:
; - sprinkler
; - position
(: make-placement (sprinkler position -> placement))
(define-record placement
  make-placement
  placement?
  (placement-sprinkler sprinkler)
  (placement-position position))

; Aufgabe 2b: Distanzberechnung

(: euclidean-distance (position position -> real))
(define euclidean-distance
  (lambda (position1 position2)
    (sqrt (+ (expt (- (position-x position1) (position-x position2)) 2) (expt (- (position-y position1) (position-y position2)) 2)))))

; Aufgabe 2c: Irrigation funktion (und Hilfsfunktionen)

(: flower-distance (flower placement -> real)) ; Zwischenschritt für die Berechnung der Distanz Sprinkler -> Blume
(define flower-distance
  (lambda (a_flower a_placement)
    (euclidean-distance (placement-position a_placement) (flower-position a_flower))))

(: in-range? (flower placement -> boolean)) ; in-range? returns whether a flower is in range of a sprinkler position or not {#t , #f}
(define in-range?
  (lambda (a_flower a_placement)
    (cond
      ((< (flower-distance a_flower a_placement) (sprinkler-range (placement-sprinkler a_placement))) #true)
      (else #false))))

(: my-watered-flower (flower real -> flower))
(define my-watered-flower
  (lambda (a_flower a_placement) ; flower and placement can return the data needed for the calc
    (draw-irrigation (make-flower (flower-name a_flower) (+ (flower-water a_flower) (* (sprinkler-effectivity (placement-sprinkler a_placement)) 100 (- 1 (/ (flower-distance a_flower a_placement) (sprinkler-range (placement-sprinkler a_placement)))))) (flower-position a_flower)) a_placement) ))
    

(: irrigate (flower placement -> flower))
(define irrigate
  (lambda (a_flower a_placement)
    (cond
      ((in-range? a_flower a_placement) (my-watered-flower a_flower a_placement)) ; passing the flower in question and the sprinkler effectivity to the func
      (else (draw-irrigation a_flower a_placement))))) ; if the flower is not in range, just return the unchanged flower

; Aufgabe 2d: Draw irrigation
(: draw-irrigation (flower placement -> image))
(define draw-irrigation
  (lambda (a_flower a_placement)
    (place-image
     (circle (sprinkler-range (placement-sprinkler a_placement)) "outline" "blue")
     (position-x (placement-position a_placement)) (position-y (placement-position a_placement))
     (place-image
      (circle 4 "solid" "red")
      (position-x (flower-position a_flower)) (position-y (flower-position a_flower))
      (empty-scene 200 200 "white")))))
  
(define my-flower (make-flower "Rose" 30 (make-position 52 90)))
(define my-sprinkler (make-sprinkler 40 0.3))
(define my-placement (make-placement my-sprinkler (make-position 50 72)))

(irrigate my-flower my-placement)

; flower "Rose" at pos (10 10) started at 30 water level and now has 57!