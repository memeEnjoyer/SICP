#lang scheme

(define (square n)
	(* n n))
(define (smallest-divisor n)
	(find-divisor n 2))
(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
				((divides? test-divisor n) test-divisor)
				(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
	(= (remainder b a) 0))
(define (prime? n)
	(= n (smallest-divisor n)))
#|
(define (filtered-accumulate filter combiner null-value term a next b)
	(cond ((> a b) null-value)
				((filter a)
				 ((combiner (term a)
							(filtered-accumulate 
								filter combiner null-value term (next a) next b))))
				(else (filtered-accumulate
								filter combiner null-value term (next a) next b))))
|#
(define (inc n)
	(+ n 1))
(define (prime-square-sum a b)
	(filtered-accumulate prime? + 0 square a inc b)) 
(define (filtered-accumulate filter combiner null-value term a next b)
	(define (iter a result)
		(cond ((> a b) result)
					((filter a)
					 (iter (next a) (combiner (term a) result)))
					(else (iter (next a) result))))
	(iter a null-value))
(prime-square-sum 1 10)
#|
1 is not a prime number so the answer should be 87
but this is the predicate issue, not filtered-accumulate
|#
(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))
(define (pos-int-product n)
	(define (rel-prime-n? i)
		(if (= (gcd i n) 1)
			#t
			#f))
	(filtered-accumulate rel-prime-n? * 1 identity 1 inc n))
(pos-int-product 10)

