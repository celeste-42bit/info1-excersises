(: calendar-date-ok? (calendar-date -> boolean))

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

(define first_date (make-calendar-date 12 11 2022))
(define second_date (make-calendar-date 06 03 1921))
(define illegal_date (make-calendar-date 69 666 420))

(check-within (date-day calendar-date) 1 30)
(check-within (date-mon calendar-date) 1 12)
(check-within (date-yea calendar-date) 0 2023)

(define calendar-date-ok?
    (lambda (date)
        (if (date-day calendar-date) >= 1 and (date-day calendar-date) <= 31
            #t
            #f)))