#lang scheme

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (proc a b c)
	(cond ((and (>= a c) (>= b c)) (sum-of-squares a b))
				((and (>= a b) (>= c b)) (sum-of-squares a c))
				((and (>= b c) (>= a c)) (sum-of-squares b a))
				((and (>= b a) (>= c a)) (sum-of-squares b c))
				((and (>= c b) (>= a b)) (sum-of-squares c a))
				((and (>= c a) (>= b a)) (sum-of-squares c b))))


(proc 1 4 3)
