#lang scheme

(define (accumulate combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a)
							(accumulate combiner null-value term (next a) next b))))
(define (sum term a next b)
	(accumulate + 0 term a next b))
(define (identity a)
	a)
(define (inc n)
	(+ n 1))
(sum identity 1 inc 3)
(define (accumulate-iter combiner null-value term a next b)
	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (combiner (term a) result))))
	(iter a null-value))
(define (product term a next b)
	(accumulate-iter * 1 term a next b))
(product identity 1 inc 3)
