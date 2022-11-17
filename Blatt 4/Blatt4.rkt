# lang racket
; calendar-date record creating a date object with following attributes
; date-day -> Day
; date-mon -> Month
; date-yea -> Year

(define-record calendar-date
    make-calendar-date
    calendar-date?
    (date-day natural)
    (date-mon natural)
    (date-yea natural))

(make-cd 17 11 2022)

(check-within (date-day) 1 30)
(check-within (date-mon) 1 12)
(check-within (date-yea) 0 2022)

;(define calendar-date-ok?
;    (lambda d
;        (if )))