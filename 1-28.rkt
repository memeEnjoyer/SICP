#lang scheme

(define (square n)
	(* n n))
(define (miller-rabin-prime? n)
	(define (iter a)
		(cond ((= a n) #t)
					((= (expmod a (- n 1) n) 0) #f)
					(else	(iter (+ a 1)))))
	(iter 0))
(define (expmod base exp m)
	(define (squaremod n)
		(if(and (or (not(= n 1)) (not(= n exp)))
						(= (square n) (remainder 1 (+ exp 1))))
			(square n)
			0))
	(cond ((= exp 0) 1)
				((even? exp)
				 (remainder (squaremod (expmod base (/ exp 2) m))
										m))
				(else
					(remainder (* base (expmod base (- exp 1) m))
										 m))))
(miller-rabin-prime? 3)
#|
Doesn't work :(
|#
