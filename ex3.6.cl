;Soderjimoe liuboi hesh-tablitsi mojet biti predstavleno v vide
;asotiativnogo spisca s elementami (k . v) dlea cajdoi pari cliuchi-znachenie
;Opredelite functiu, stroiashiuiu

;a.
;hesh-tablitsu po assotiativnomu spiscu
(setf x '(
          (a . 1)
          (b . 2)
          (c . 3)
          (d . 4)
          )
      )

(defun to-hash(asc)
  (do* 
        ((hsh (make-hash-table))
         (asc-temp asc)
         lst
         )
        ((null asc-temp) hsh)
        (setf lst (pop asc-temp))
        (setf (gethash (car lst) hsh) (cdr lst))
        )
  )

;(print (gethash 'b (to-hash x)))


;b.
;assotiativnii spisoc po hesh tablitse
(defun to-assoc(hsh)
  (let
    ((asc nil))
    (maphash #'(lambda(k v)
                 (push (cons k v) asc)
                 )
             hsh)
    asc)
  )

(setf hsh (make-hash-table))
(setf (gethash 'a hsh) 1)
(setf (gethash 'b hsh) 2)
(setf (gethash 'c hsh) 3)
(setf (gethash 'd hsh) 4)

(print (to-assoc hsh))
