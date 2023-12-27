#lang scheme
#|
(define (expt b n) 
	(define (expt-iter a b cnt n)
		(if(or (and (not (even? cnt)) (> cnt (+ n 1))) (and (even? cnt) (>= cnt (* 2 n)))) 
			a
			(if (and (<= (* cnt 2) (* n 2)) (>= cnt 2))
				(expt-iter (square a) b (* cnt 2) n)
				(expt-iter (* b a) b (+ cnt 1) n)
			)))
	(expt-iter 1 b 1 n))

(define (even? a)
	(= (remainder a 2) 0))

(define (square a)
	(* a a))

(expt 3 7)

|#

(define (expt b n)
	(define (expt-iter a b n)
		(cond ((= n 0) a)
					((even? n) (expt-iter a (square b) (/ n 2)))
					(else (expt-iter (* b a) b (- n 1)))))
	(expt-iter 1 b n))

(define (even? n)
	(= (remainder n 2) 0))

(define (square n)
	(* n n))

(expt 3 7)
