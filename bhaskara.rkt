
#lang racket

(define (delta a b c)
  (-(* b b ) (* 4 a c))
)

(define (find-x1 a b c)
  (/ (+(- b) (sqrt (delta a b c))) (* 2 a))
)

(define (find-x2 a b c)
  (/ (-(- b) (sqrt (delta a b c))) (* 2 a))
)

(define (bhaskara a b c)
  (~a "delta=" (delta a b c) " x1=" (find-x1 a b c)" x2="(find-x2 a b c))
)

(define (say-results a b c)
  (write(bhaskara a b c))
 )