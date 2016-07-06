;napishite programu, cotoraia ishet naibolee dlinii puti v seti,
;ne soderjashii povtorenii. Seti mojet soderjati ticli
(defun longest-path(start end sett)
  (reverse (longest-path_((list start) end sett)))
  )

(defun longest_path_(paths end sett)
  (if
    (null sett)
    nil
    (let* (
           (paths-temp (cdr paths))
           (current-path (car paths))
           )
      (if
        (equal (car current-path) end)
        (OR (longest-path_ paths-temp end sett) current-path)
        (longest-path_ (append paths-temp (gen-next current-path end sett)) end sett)
        )
      )
    )
  )

(defun gen-next(current-path end sett)
  )
