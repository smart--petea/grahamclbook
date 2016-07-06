;Opredelite functiou, pechataiushuiu zadannii spisoc v tochechnoi
;notatii:
;(showdots '(a b c))
;(A . (B . (C . NIL)))
(defun showdots(lst)
  (cond 
    ((null lst) (format t "NIL"))
    ((atom lst) (format t "~S" lst))
    (t (let ()
        (format t "(")
        (showdots (car lst))
        (format t " . ")
        (showdots (cdr lst))
        (format t ")")
        )
       )
    )
  )

(showdots '(a b c))
