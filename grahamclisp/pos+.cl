;Functia pos+ prinimaet spisoc i vozvrashaet novii, cajdii element
;cotorogo uvelichen po sravneniu s ishodnim na ego polojenie
;v spiske
;(pos+ '(7 5 1 4))
;(7 6 3 7)
(defun pos+-iter(lst)
  (do*
    ((index 0 (1+ index))
     (temp-lst lst)
     (rez (list (+ index (pop temp-lst))) (append rez (list (+ index (pop temp-lst)))))
     )
    ((null temp-lst) rez)
    )
  )
(print (pos+-iter '(7 5 1 4)))

(defun pos+-recursive(lst)
  (pos+-recursive-helper lst 0)
  )

(defun pos+-recursive-helper(lst index)
  (if (null lst)
    nil
    (cons (+ index (car lst)) (pos+-recursive-helper (cdr lst) (1+ index)))
    )
  )

(print (pos+-recursive '(7 5 1 4)))

(defun pos+-mapcar(lst)
  (let
    ((index -1))
    (mapcar #'(lambda(e) 
                (incf index)
                (+ index e)
                )
            lst
            )
    )
  )

(print (pos+-mapcar '(7 5 1 4)))
