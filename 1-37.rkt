#lang scheme

(define (cont-frac n d k)
	(define (fract a b i)
		(let ((ni (n i))
					(di (d i)))
				(cond ((= i k) (/ a b))
							(else
								(/ a (+ b (fract ni di (+ i 1))))))))
	(fract (n 1) (d 1) 1))
(/ 1 (cont-frac (lambda (i) 1.0)
					 (lambda (i) 1.0)
					 14))
(define (cont-frac-iter n d k)
	(define (iter a result i)
		(let ((ni (n i))
					(di (d i)))
			(cond ((= i k) result)
						(else
							(iter result (/ ni (+ di a)) (+ i 1))))))
	(iter 0 0 1))
(cont-frac-iter (lambda (i) 1.0)
								(lambda (i) 1.0)
								100)
#|
Iter version probably does'nt work correctly
|#


