;Напишите функцию, определяющую количество повторений (с точки зрения eql) каждного
;элемента в заданном списке и сортирующую
;их по убыванию встречаеости:
;(occurrences '(a b a d a c d c a))
(defun occurences(lst)
  (do*
    ((dict nil)
     (el (car lst) (car temp))
     (temp (cdr lst) (cdr temp))
     )
    ((null temp) (sort dict #'> :key #'cdr))
    (if (null (assoc el dict))
     (setf dict (append dict (list (cons el 1))))
     (incf (cdr (assoc el dict)))
    )
  )
  )

(print (occurences '(a b a d a c d c a)))
