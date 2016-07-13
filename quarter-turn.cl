;Opredelite functiu, povorachivaiushuiu cvadratnii massiv (massiv
;s razmernosteami (n n)) na 90 gradusov po chasovoi strelke
;(quarter-turn #2A((a b)(c d)))
;#2A((C A) (D B))

(setf arr (make-array '(3 3)))
(setf (aref arr 0 0) 0 (aref arr 0 1) 1 (aref arr 0 2) 2
      (aref arr 1 0) 3 (aref arr 1 1) 4 (aref arr 1 2) 5
      (aref arr 2 0) 6 (aref arr 2 1) 7 (aref arr 2 2) 8)

(defun quarter-turn (arr)
  (do*
    ((n (car (array-dimensions arr)))
     (brr (make-array (array-dimensions arr)))
     (i 0 (1+ i))
     )
    ((equal n i) brr)
    (do*
      ((j 0 (1+ j))
       )
      ((equal n j))
      (setf (aref brr j (- n i 1)) (aref arr i j))
      )
    )
  )

(print (quarter-turn arr))

