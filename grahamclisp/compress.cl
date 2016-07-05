;Izmenite programmu na ris 3.6 taim obrazom, chtobi ona sozdavala
;menishee colichestvo iacheek. (Podscazca: ispolizuite tochecnie pari)
(defun compress (x)
  (if (consp x)
    (compr (car x) 1 (cdr x))
    x)
  )

(defun compr(elt n lst)
  (if (null lst)
    (list (n-elts elt n))
    (let ((next (car lst)))
      (if (eql next elt)
        (compr elt (+ n 1) (cdr lst))
        (cons (n-elts elt n)
              (compr next 1 (cdr lst)))))))

(defun n-elts(elt n)
  (if (> n 1)
    (cons elt n)
    elt)
  )

(print (compress '(a a a b a c a b b b d c c s)))
