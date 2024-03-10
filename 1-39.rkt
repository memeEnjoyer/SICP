#lang scheme

(define (cont-frac n d k)
	(define (fract a b i)
		(let ((ni (n i))
					(di (d i)))
			(cond ((= i k) (/ a b))
							(else
								(/ a (+ b (fract ni di (+ i 1))))))))
	(fract (n 1) (d 1) 1))
(define (square x)
	(* x x))
(define (odd? x)
	(= (remainder x 2) 1))
(define (tan-cf x k)
	(define (n i)
		(if (= i 1)
			x
			(square x)))
	(define (d i)
		(- (* 2 i) 1))
	(cont-frac n d k))
(tan-cf 3.14 1000)
