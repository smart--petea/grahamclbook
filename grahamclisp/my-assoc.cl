(defun my-assoc(what lst)
  (dolist (e lst nil)
    (if (equal (car e) what) (return e))
    )
  )

(print (my-assoc 'a '((b b1) (a a1) (c c1))))

;graham version
(defun our-assoc (key alist)
  (and (consp alist)
       (let ((pair (car alist)))
         (if (eql key (car pair))
           pair
           (our-assoc key (cdr alist))))))
