;(defun read-integer(str)
;  (if (every #'digit-char-p str) ;each element of str deservers the digit-char-p predicate
;    (let ((accum 0))
;      (dotimes (pos (length str))
;        (setf accum (+ (* accum 10)
;                       (digit-char-p (char str pos)))))
;      accum)
;    nil))
;graham read-integer via do cycle
(defun do-read-integer(str)
  (if (every #'digit-char-p str)
    (do*
      ((len (length str))
       (pos 0 (1+ pos))
       (accum (digit-char-p (char str 0)) (+ (* accum 10)
                                             (digit-char-p (char str pos)))))
       ((equal len (1+ pos)) accum)
       )
    )
  )

(print (do-read-integer "10145"))
