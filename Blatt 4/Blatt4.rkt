;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "beginner-reader.rkt" "deinprogramm" "sdp")((modname Blatt4) (read-case-sensitive #f) (teachpacks ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp"))) (deinprogramm-settings #(#f write repeating-decimal #f #t none explicit #f ((lib "image.rkt" "teachpack" "deinprogramm" "sdp") (lib "universe.rkt" "teachpack" "deinprogramm" "sdp")))))
; Aufgabe 1):

;a):

;calendar-date bestehend aus:
;Datums (Tag, Monat, Jahr):
; - tag (Tag)                          
; - monat (Monat)                    
; - jahr (Jahr)
(: make-calendar-date (natural natural natural -> calendar-date)) 
(: calendar-date-day  (calendar-date -> natural))
(: calendar-date-month (calendar-date -> natural))
(: calendar-date-year (calendar-date -> natural))
(define-record calendar-date
  make-calendar-date                         ; Konstruktor
  calendar-date?                               ; Prädikat
  (calendar-date-day  natural)                 ; Selektor 
  (calendar-date-month natural)                ; Selektor //? noch string ein bringen für"."?
  (calendar-date-year natural))               ; Selektor


(define c (make-calendar-date 12 12 2000))

c

;b):

;Check if is a valid calendar-date
(: calendar-date-ok? (calendar-date -> boolean))

(check-expect (calendar-date-ok?(make-calendar-date 12 6 2000))  #t)
(check-expect (calendar-date-ok?(make-calendar-date 25 7 1987))  #t)
(check-expect (calendar-date-ok?(make-calendar-date 1 9 1867))  #t)
(check-expect (calendar-date-ok?(make-calendar-date 12 6 20000))  #t)
(check-expect (calendar-date-ok?(make-calendar-date 29 2 2000))  #f)
(check-expect (calendar-date-ok?(make-calendar-date 277 9 2000))  #f)
(check-expect (calendar-date-ok?(make-calendar-date 12 628329 20))  #f)

(define calendar-date-ok?
  (lambda (c)
    (if
       ( month-ok? (calendar-date-month c))
        (cond
          ( (= (calendar-date-month c) 1)   ( 31-days? (calendar-date-day c) ) )
          ((= (calendar-date-month c) 2 ) (<= 1 ( calendar-date-day c) 28 ))
          ((or (= (calendar-date-month c) 3 ) (= (calendar-date-month c) 5 ) )
           ( 31-days? (calendar-date-day c) ))
          ((or (= (calendar-date-month c) 7 ) (= (calendar-date-month c) 8 ) )
           ( 31-days? (calendar-date-day c) ))
          ((or (= (calendar-date-month c) 10 ) (= (calendar-date-month c) 12 ) )
           ( 31-days? (calendar-date-day c) ))
        
          (else      (<= 1 ( calendar-date-day c)  30 ) )  )#f 
      
         
      ))) 

;Hilfsfunktionen: 

;Abfrage nach dem Monat

(: month-ok? (natural -> boolean))

(define month-ok?
  (lambda (m) 
   (<= 1 m 12)) )

;abfrage ob es 31 Tage sind

(: 31-days? (natural -> boolean))

(define 31-days?
(lambda (d)
   (<= 1 d 31)))  


;(calendar-date-ok? (make-calendar-date 12 12 2000) )

;c):

;Check if the calader-date is valid and a leap year

(: calendar-date-ok/leap-year? (calendar-date -> boolean))

(check-expect ( calendar-date-ok/leap-year?(make-calendar-date 12 6 20000))  #t)
(check-expect (calendar-date-ok/leap-year?(make-calendar-date 29 2 2000))  #t)
(check-expect ( calendar-date-ok/leap-year?(make-calendar-date 277 9 2000))  #f)
(check-expect ( calendar-date-ok/leap-year?(make-calendar-date 29 628329 20))  #f)
;(check-expect (calendar-date-ok/leap-year?(make-calendar-date 29 2 1900))  #f)

(define calendar-date-ok/leap-year?
  (lambda (c)
    (if
       ( month-ok? (calendar-date-month c))
        (cond
          ( (= (calendar-date-month c) 1)   ( 31-days? (calendar-date-day c) ) )
          ((= (calendar-date-month c) 2 )
           (if (= (modulo (calendar-date-year c) 4) 0) (<= 1 (calendar-date-day c) 29) (<= 1 ( calendar-date-day c) 28 )))
          ((or (= (calendar-date-month c) 3 ) (= (calendar-date-month c) 5 ) )
           ( 31-days? (calendar-date-day c) ))
          ((or (= (calendar-date-month c) 7 ) (= (calendar-date-month c) 8 ) )
           ( 31-days? (calendar-date-day c) ))
          ((or (= (calendar-date-month c) 10 ) (= (calendar-date-month c) 12 ) )
           ( 31-days? (calendar-date-day c) ))
        
          (else      (<= 1 ( calendar-date-day c)  30 ) )  )#f 
      
         
      )))

; -------------------------------------------------------------------------------------------------------------------------------------------------


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
  (lambda (start_flower a_flower a_placement) ; flower and placement can return the data needed for the calc
    (draw-irrigation start_flower (make-flower (flower-name a_flower) (+ (flower-water a_flower) (* (sprinkler-effectivity (placement-sprinkler a_placement)) 100 (- 1 (/ (flower-distance a_flower a_placement) (sprinkler-range (placement-sprinkler a_placement)))))) (flower-position a_flower)) a_placement) ))
    

(: irrigate (flower placement -> flower))
(define irrigate
  (lambda (a_flower a_placement)
    (cond
      ((in-range? a_flower a_placement) (my-watered-flower a_flower a_flower a_placement)) ; passing the flower in question and the sprinkler effectivity to the func
      (else (draw-irrigation a_flower a_flower a_placement))))) ; if the flower is not in range, just return the unchanged flower

; Aufgabe 2d: Draw irrigation and helper functions
(: flower-green (flower placement -> image))
(define flower-green
    (lambda (a_flower a_placement)
    (place-image
     (circle (sprinkler-range (placement-sprinkler a_placement)) "outline" "blue")
     (position-x (placement-position a_placement)) (position-y (placement-position a_placement))
     (place-image
      (circle 4 "solid" "green")
      (position-x (flower-position a_flower)) (position-y (flower-position a_flower))
      (empty-scene 200 200 "white")))))

(: flower-red (flower placement -> image))
(define flower-red
    (lambda (a_flower a_placement)
    (place-image
     (circle (sprinkler-range (placement-sprinkler a_placement)) "outline" "blue")
     (position-x (placement-position a_placement)) (position-y (placement-position a_placement))
     (place-image
      (circle 4 "solid" "red")
      (position-x (flower-position a_flower)) (position-y (flower-position a_flower))
      (empty-scene 200 200 "white")))))

(: draw-irrigation (flower placement -> image))
(define draw-irrigation
  (lambda (start_flower a_flower a_placement)
    (cond
      ((< (flower-water start_flower) (flower-water a_flower)) (flower-green a_flower a_placement))
      ((= (flower-water start_flower) (flower-water a_flower)) (flower-red a_flower a_placement))
      (else "ERROR"))))
    
  ; --------------------------------------------------------------------------------------------------------
(define my-flower (make-flower "Rose" 30 (make-position 30 90)))          ; FLOWER
(define my-sprinkler (make-sprinkler 40 0.3))                             ; SPRINKLER
(define my-placement (make-placement my-sprinkler (make-position 50 72))) ; SPRINKLER PLACEMENT
  ; --------------------------------------------------------------------------------------------------------

(irrigate my-flower my-placement)