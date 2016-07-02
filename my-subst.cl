(defun my-subst(y x tr)
  (cond
    ((equal x tr) y)
    ((OR (null tr) (symbolp tr)) tr)
    (t
      (cons
        (my-subst y x (car tr))
        (my-subst y x (cdr tr))
        )
      )
    )
  )

(print (my-subst 'a 'b '(a b c d a b c)))
(print (my-subst 'a 'b '(a (b c d a) b c)))
(print (my-subst '(ok google) 'b '(a (b c d a) b c)))

;graham variant
(defun our-subst (new old tree)
  (if (eql tree old)
    new
    (cons (our-subst new old (car tree))
          (our-subst new old (cdr tree))
          )
    )
  )
