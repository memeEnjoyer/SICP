#lang scheme

(define (mult b n)
	(define (mult-iter a b n)
		(cond ((= n 0) a)
					((even? n) (mult-iter a (double b) (halve n)))
					(else (mult-iter (+ a b) b (- n 1)))))
	(mult-iter 0 b n))

(define (even? n)
	(= (remainder n 2) 0))

(define (double n)
	(+ n n))

(define (halve n)
	(/ n 2))

(mult 8 8)
