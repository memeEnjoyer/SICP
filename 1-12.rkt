#lang scheme

(define (pasc-tri elem row)
	(if(or (= elem 1) (= elem row))
		1
		(+ (pasc-tri (- elem 1) (- row 1)) (pasc-tri elem (- row 1)))))

(pasc-tri 4 8)
