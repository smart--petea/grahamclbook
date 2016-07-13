(defun copy-list-reduce(lst)
  (reduce #'append (mapcar #'list lst))
  )

(print (copy-list-reduce '(a b c)))
