;Opredelite functiu, cotoraia stroit iz BST-dereva spisoc ego obiectov
;otsortirovanii ot bolishego c menishemu
(defstruct node
  ellt
  (l nil)
  (r nil)
  )

(defun bst-insert (obj bst <)
  (if (null bst)
    (make-node :ellt obj)
    (let ((ellt (node-ellt bst)))
      (if (eql obj ellt)
        bst
        (if (funcall < obj ellt)
          (make-node
            :ellt ellt
            :l (bst-insert obj (node-l bst) <)
            :r (node-r bst)
            )
          (make-node
            :ellt ellt
            :r (bst-insert obj (node-r bst) <)
            :l (node-l bst)
            )
          )
        )
      )
    )
  )

(setf tr  (bst-insert 10 nil #'<))
(setf tr (bst-insert 9 tr #'<))
(setf tr (bst-insert 14 tr #'<))
(setf tr (bst-insert 13 tr #'<))
(setf tr (bst-insert 15 tr #'<))

;(print tr)
(defun bst-to-list(lst)
  (if (null lst)
    nil
    (append
       (bst-to-list (node-l lst))
       (list (node-ellt lst))
       (bst-to-list (node-r lst))
       )
    )
  )

(print (bst-to-list tr))
