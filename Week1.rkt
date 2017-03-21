#lang scheme
(define-struct Item(id description price))
(define toolbelt(list 1 "Toolbelt" 17.99))
(define hammer(list 2 "12oz Hammer" 15.99))
(define screwdriver(list 3 "Screwdriver set" 30.99))
(define toolset(list 4 "Variety Tool Set" 65.99))
(define 2x4x10(list 5 "Pine 2x4 10foot " 3.54))
(define deckscrews(list 6 "5lb box of deck screws" 19.99))
(define foamboard(list 7 "3inch 4'x8' foam board" 12.99))
(define itemlist(list 1 2 3 4 5 6 7))

(define (lookup id)
   (case (+ 0 id)
   ((1) toolbelt)
   ((2) hammer)
   ((3) screwdriver)
   ((4) toolset)
   ((5) 2x4x10)
   ((6) deckscrews)
   ((7) foamboard)
   )
  )

(define (getdesc id)
  (car (cdr(lookup id)))
  )

(define (getprice id)
  (car (cdr (cdr(lookup id))))
  )

(define (Subtotal listofitems)
  (if
   (null? listofitems)
   0
   (+ (getprice (car listofitems)) (Subtotal(cdr listofitems)))))

(define (Total listofitems)
  (if
   (null? listofitems)
   0
   (+ (+ (getprice (car listofitems)) (Subtotal(cdr listofitems)))(* (+ (getprice (car listofitems)) (Subtotal(cdr listofitems))) .11)
   )))


(display '"The command to see the list of items is: itemlist")
(newline)
(display '"The command to get the subtotal of the items you have selected is: (Subtotal (list *id id id id.......*))")
(newline)
(display '"The command to get the total of the items you have selected is: (Total (list *id id id.....*))")
