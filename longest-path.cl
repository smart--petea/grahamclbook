;napishite programu, cotoraia ishet naibolee dlinii puti v seti,
;ne soderjashii povtorenii. Seti mojet soderjati ticli
(defun longest-path(start end sett)
  (reverse (longest-path_ (list (list start)) end sett))
  )

(defun longest-path_(paths end sett)
  (if
    (null paths)
    nil
    (let* (
           (paths-temp (cdr paths))
           (current-path (car paths))
           )
      (if
        (equal (car current-path) end)
        (OR (longest-path_ paths-temp end sett) current-path)
        (longest-path_ (append paths-temp (gen-next current-path sett)) end sett)
        )
      )
    )
  )

(defun gen-next(current-path sett)
  (mapcar
    #'(lambda(e) (cons e current-path))
    (cdr (assoc (car current-path) sett))
  )
  )

(setf sett '(
          (a b c)
          (b d e)
          (d g i)
          (e i)
          (c f j)
          (j k)
          (g h i)
          (i j)
          )
      )

(print (longest-path 'a 'j sett))
