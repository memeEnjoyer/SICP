#lang scheme

(define (ssq a b) (+ (* a a) (* b b)))

(define (proc x y z)
	(cond ((and (<= x y) (<= x z)) (ssq y z))
				((and (<= y x) (<= y z)) (ssq x z))
				(else (ssq x y))))

(proc 1 2 3)
