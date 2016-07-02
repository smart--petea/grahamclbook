(defun my-len(lst)
  (if
    (null lst)
    0
    (1+ (my-len (cdr lst)))
    )
  )

(print (my-len '(ok google)))

;graham variant
(defun len(lst
            (if (null lst)
              0
              (+ (len (cdr lst)) 1)
              )
            )
  )
