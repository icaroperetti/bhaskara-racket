
#lang racket

(define (delta a b c)
  (-(* b b ) (* 4 a c))
)

(define (findX1 a b c)
  (/ (+(- b) (sqrt (delta a b c))) (* 2 a))
)

(define (findX2 a b c)
  (/ (-(- b) (sqrt (delta a b c))) (* 2 a))
)

(define (bhaskara a b c)
  (~a "delta=" (delta a b c) " x1=" (findX1 a b c)" x2="(findX2 a b c))
)

(define (show-results a b c)
  (write(bhaskara a b c))
 )
