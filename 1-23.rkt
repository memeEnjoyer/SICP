#lang scheme

(define (square x)
	(* x x))
(define (next x)
	(if (= x 2)
		3
		(+ x 2)))
(define (smallest-divisor n)
	(find-divisor n 2))
(define (find-divisor n test-divisor)
	(cond ((> (square test-divisor) n) n)
				((divides? test-divisor n) test-divisor)
				(else (find-divisor n (next test-divisor)))))
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
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)

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

1000003 0.0122
1000033 0.0117
1000037 0.0112
|#


