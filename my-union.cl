;Напишите свой вариант функции union, который сохраняет порядок
;следования элементов согласно исходным спискам
;(new-union '(a b c) '(b a d))
(defun new-union(lst lst1)
  (cond
    ((null lst) lst1)
    ((null lst1) lst)
    (t (do*
         (
          (el (car lst) (car lst-temp))
          (el1 (car lst1) (car lst1-temp))
          (lst-temp (remove el (remove el1 lst)) (remove el1 (remove el lst-temp)))
          (lst1-temp (remove el1 (remove el lst1)) (remove el (remove el1 lst1-temp)))
          (rez
            (if (equal el el1) (list el) (list el el1))
            (let
              ((ellst (if (equal el el1) (list el) (list el el1))))
              (cond
                ((null lst-temp) (append rez ellst lst1-temp))
                ((null lst1-temp) (append rez ellst lst-temp))
                (t (append rez ellst))
              )
            )
          )
          )
         ((or (null lst1-temp) (null lst-temp)) rez)
         )
       )
    )
  )

(print (new-union '(a b c) '(b a d)))
