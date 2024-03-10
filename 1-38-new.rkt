#lang scheme

(define (cont-frac n d k)
	(define (fract a b i)
		(let ((ni (n i))
					(di (d i)))
				(cond ((= i k) (/ a b))
							(else
								(/ a (+ b (fract ni di (+ i 1))))))))
	(fract (n 1) (d 1) 1))
(define (e-approx count)
	(let ((quant 2)
				(pointer 2))
		(cond ((= pointer count) quant (+ quant 2))
					(else 1))))
(cont-frac (lambda (x) 1.0)
						e-approx
						1000)
