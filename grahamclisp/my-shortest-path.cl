(setf minn '(
             (a b c d)
             (b e f)
             (c)
             (d g)
             (e h)
             (f)
             (g s)
             (h s)
             )
      )

(defun my-shortest-path(start end net)
  (cond
    ((or (equal start end) 
         (null (assoc start net))
         )
         nil)
    ((member end (assoc start net)) (list start end))
    (t (do*
         (
          (nexts (cdr (assoc start net)) (cdr nexts))
          (temp-path (my-shortest-path (car nexts) end net) (my-shortest-path (car nexts) end net))
          (min-path temp-path (if (and (not (null temp-path)) (> (length min-path) (length temp-path))) temp-path min-path))
         )
         ((null nexts) (if (null min-path) nil (cons start min-path)))
         )
       )
    )
  )

(print (my-shortest-path 'a 's minn))

;graham variant
(defun shortest-path(start end net)
  (bfs end (list (list start)) net))

(defun bfs (end queue net)
  (if (null queue)
    nil
    (let ((path (car queue)))
      (let ((node (car path)))
        (if (eql node end)
          (reverse path)
          (bfs end
               (append (cdr queue)
                       (new-paths path node net))
               net))))))

(defun new-paths (path node net)
  (mapcar #'(lambda (n)
              (cons n path))
          (cdr (assoc node net))))

