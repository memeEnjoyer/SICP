#lang scheme

(define (square x)
	(* x x))
(define (smallest-divisor n)
	(find-divisor n 2))
(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
				((divides? test-divisor n) test-divisor)
				(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
	(= (remainder b a) 0))
(define (expmod base exp m)
	(cond ((= exp 0) 1)
				((even? exp)
				 (remainder (square (expmod base (/ exp 2) m))
										m))
				(else
					(remainder (* base (expmod base (- exp 1) 1))
										 m))))
(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))
(define (fast-prime? n times)
	(cond ((= times 0) true)
				((fermat-test n) (fast-prime? n (- times 1)))
				(else false)))
(define (prime? n)
	(fast-prime? n 100))
(define (timed-prime-test n)
	(newline)
	(display n)
	(start-prime-test n (current-inexact-milliseconds)))
(define (start-prime-test n start-time)
	(if (prime? n)
	(report-prime (- (current-inexact-milliseconds) start-time))
	0))
(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))
(timed-prime-test 1009)
(timed-prime-test 10007)
(timed-prime-test 100003)

#| 
1009 0.00146
1013 0.00122
1019 0.00146

10007 0.00244
10009 0.00293
10037 0.00293

100003 0.00537
100019 0.00415
100043 0.00439

0.0122
0.0117
0.0112
|#


