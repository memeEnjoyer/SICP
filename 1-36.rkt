#lang scheme

(define (average a b)
	(/ (+ a b) 2))
(define tolerance 0.00001)
(define (fixed-point f first-guess)
	(define (close-enough? v1 v2)
		(< (abs (- v1 v2)) tolerance))
	(define (try guess)
		(display guess)
		(newline)
		(let ((next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))
	(try first-guess))
(define (x-expx x)
	(fixed-point (lambda (x) (/ (log 1000) (log x)))
							 1.1))
(x-expx 1)
(define (x-expx-avdamp x)
	(fixed-point (lambda (x) (average x (/ (log 1000) (log x))))
							 1.1))
(x-expx-avdamp 1)


#|
34 steps
13 steps
|#

