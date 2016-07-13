;sozdaite structuru dlea dereva, cajdii uzel cotorogo pomimo
;necotorih dannih imeet treh potomcov.

(defstruct my-tree
  (data nil)
  (frst nil)
  (scnd nil)
  (thrd nil)
  )

;Opredelite:
;a.
;functiu, copiriushiu. tacoe derevo (cajdii uzel scopirovanovogo dereva ne doljen biti e
;ecvivalenten ishodnomu s tochki zrenia eql
(defun my-tree-copy(mtree)
  (if (null mtree)
    nil
    (make-my-tree
      :data (my-tree-data mtree)
      :frst (my-tree-frst mtree)
      :scnd (my-tree-scnd mtree)
      :thrd (my-tree-thrd mtree)
      )
    )
  )

(setf el1 (make-my-tree
            :data 1
            :frst nil
            :scnd nil
            :thrd nil)
      )

(setf el4 (make-my-tree
            :data 4
            :frst nil
            :scnd nil
            :thrd nil)
      )

(setf el2 (make-my-tree
            :data 2
            :frst nil
            :scnd el4
            :thrd nil)
      )

(setf el3 (make-my-tree
            :data 3
            :frst nil
            :scnd nil
            :thrd nil)
      )

(setf el0 (make-my-tree
            :data 0
            :frst el1
            :scnd el2
            :thrd el3)
      )
;b.
;functiu, prinimaiushuiu obiect i tacoe derevo i vozvrashaiushuiu
;istinu, esli etot obiect vstrechaetsea (s tochki zrenia eql)
;v pole dannih hotea bi odnogo uzla dereva
(defun my-tree-find(obj mtree)
  (cond
    ((null mtree) nil)
    ((eql obj (my-tree-data mtree)) t)
    (t (OR
        (my-tree-find obj (my-tree-frst mtree))
        (my-tree-find obj (my-tree-scnd mtree))
        (my-tree-find obj (my-tree-thrd mtree))
        )
       )
    )
  )


