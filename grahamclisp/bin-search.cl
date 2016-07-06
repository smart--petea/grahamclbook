(defun my-bin-search(obj vec)
  (my-bin-search_ obj 0 (1- (length vec)) vec)
  )

(defun my-bin-search_(obj start end vec)
  (cond
    ((equal start end) (if (equal (svref vec start) obj) start nil))
    ((> start end) nil)
    (t (let*
         ((middle (+ start (round (- end start) 2)))
          (middle-obj  (svref vec middle))
          )
         (cond
           ((equal obj middle-obj) middle)
           ((> obj middle-obj) (my-bin-search_  obj (1+ middle) end vec))
           (t (my-bin-search_ obj start (1- end) vec))
           )
         )
       )
    )
  )

(print (my-bin-search 3 #(0 1 2 3 4 5 6 7 8 9)))

;graham version
(defun bin-search (obj vec)
  (let
    ((len (length vec)))
    (and (not (zerop len))
         (finder obj vec 0 (- len 1)))))

(defun finder (obj vec start end)
  (let ((range (- end start)))
    (if (zerop range)
      (if (eql obj (aref vec start))
        obj
        nil)
      (let ((mid (+ start (round (/ range 2)))))
        (let ((obj2 (aref vec mid)))
          (if (< obj obj2)
            (finder obj vec start (- mid 1))
            (if (> obj obj2)
              (finder obj vec (+ mid 1) end)
              obj)))))))
