(defun my-copy-tree(tr)
  (cond
    ((atom tr) tr)
    (t (cons
         (my-copy-tree (car tr))
         (my-copy-tree (cdr tr))
         )
       )
    )
  )

(print (my-copy-tree '(a (b c) d)))

;graham version
(defun our-copy-tree (tr)
  (if (atom tr)
    (cons (our-copy-tree (car tr))
          (our-copy-tree (cdr tr)))))
