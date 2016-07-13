(defun reverse-reduce(lst)
  (reduce #'(lambda(e f) (append f e)) (mapcar #'list lst))
  )

(print (reverse-reduce '(a b c d e)))
