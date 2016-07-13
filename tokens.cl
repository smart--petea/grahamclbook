;(tokens "ab12 3cde. f" #'alpha-char-p 0)
;("ab" "cde" "f")
(defun split-space(str &optional (start 0) )
  (do*
    (
     (start-temp start (1+ pos))
     (pos (position #\Space str :start start-temp) (position #\Space str :start start-temp))
     (rez
       (list (subseq str start-temp pos))
       (append rez
               (list
                 (if (null pos)
                   (subseq str start-temp)
                   (subseq str start-temp pos)
                   )
                 )
               )
       )
     )
    ((null pos) rez)
    )
  )

(defun my-tokens(str test start)
  (let ((raw-tokens (remove-if #'(lambda(e) (zerop (length e))) (split-space str start))))
    (if (null raw-tokens)
      nil
      (do ((rez nil (append rez (list (remove-if #'(lambda(e) (not (funcall test e))) (pop raw-tokens))))))
        ((null raw-tokens) rez)
        )
      )
    )
  )



(print (my-tokens "ab12 3cde. f" #'alpha-char-p 0))
