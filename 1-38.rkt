#lang scheme

(define (cont-frac n d k)
	(define (fract a b i)
		(let ((ni (n i))
					(di (d i)))
			(cond ((= i k) (/ a b))
							(else
								(/ a (+ b (fract ni di (+ i 1))))))))
	(fract (n 1) (d 1) 1))
(define (e-approx k)
	(define (d i)
		(let ((rem (remainder i 3)))
		(cond ((= rem 2) (+ 2 (* 2 (/ (- i rem) 3))))
					(else 1))))
	(cont-frac (lambda (x) 1.0)
						 d
						 k))
(e-approx 10)


