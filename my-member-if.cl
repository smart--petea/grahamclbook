(defun my-member-if(pred lst)
    (cond
      ((not (listp lst)) nil)
      ((null lst) t)
      ((funcall pred (car lst)) lst)
      (t (my-member-if pred (cdr lst)))
      )
    )

(print (my-member-if #'oddp '(2 3 4)))

;graham variant
(defun our-member-if (fn lst)
  (and (consp lst)
       (if (funcall fn (car lst))
         lst
         (our-member-if fn (cdr lst)))))

