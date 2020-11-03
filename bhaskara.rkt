
#lang racket

;calcula o delta
(define (delta a b c)
  (-(* b b ) (* 4 a c))
)

;calcula o valor de x1
(define (findX1 a b c)
  (/ (+(- b) (sqrt (delta a b c))) (* 2 a))
)

;calcula o valor de x2
(define (findX2 a b c)
  (/ (-(- b) (sqrt (delta a b c))) (* 2 a))
)

;faz a bhaskara 
(define (bhaskara a b c)
  (~a "delta=" (delta a b c) " x1=" (findX1 a b c)" x2="(findX2 a b c))
)

;imprime os resultados
(define (show-results a b c)
  (write(bhaskara a b c))
 )


(define (findXv a b)
  (/ ( - b )(* 2 a))
)

(define(show-Xv a b)
   (write(findXv a b))
)

(define (findYv a b c)
 (/ (-(-( * b b) ( * 4 a c))) (* 4 a))
)

(define(show-Yv a b c)
   (write(findYv a b c))
)
