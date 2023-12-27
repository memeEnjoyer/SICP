#lang scheme

(define (f n)
	(cond ((< n 3) n)
				((>= n 3)
				 (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3)))))))

(define (f-i n)
	(define (f-iter a b c n)
		(if (< n 3)
			a
			(f-iter (+ a b c) (* 2 a ) (/ (* 3 b) 2) (- n 1))))
	(f-iter 2 2 0 n))

(f 4)

(f-i 5)
