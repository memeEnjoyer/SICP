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
(define (prime? n)
	(= n (smallest-divisor n)))
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
(define (even? n)
	(= (remainder n 2) 0))
(define (search-for-primes start finish)
	(cond ((and (even? start) (< start finish))
				(search-for-primes (+ start 1) finish))
				((< start finish) (timed-prime-test start) (search-for-primes (+ start 1) finish))))
(search-for-primes 1000000 1000500)

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


