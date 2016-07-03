(defun my-reverse(lst)
  (do*
    ((temp-lst lst)
     (rez nil (cons (pop temp-lst) rez))
     )
    ((null temp-lst) rez)
    )
  )

(print (my-reverse '(a b c d e)))

;graham version
(defun our-reverse (lst)
  (let ((acc nil))
    (dolist (el lst)
      (push el acc)
      )
    acc))
