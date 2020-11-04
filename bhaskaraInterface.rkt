#lang racket/gui
(require 2htdp/batch-io) 
(define my-window (new frame%
                       [label "Bhaskara"]
                       [width 400]
                       [height 300]
                       [style '(fullscreen-button)]))

(define a-input (new text-field%
                     [parent my-window]
                     [label "Digite o A"]
                     [min-width 150]
                     [min-height 30]
                     [vert-margin 5]
                     [horiz-margin 30]))

(define b-input (new text-field%
                     [parent my-window]
                     [label "Digite o B"]
                     [min-width 50]
                     [min-height 30]
                     [vert-margin 15]
                     [horiz-margin 30]))

(define c-input (new text-field%
                     [parent my-window]
                     [label "Digite o C"]
                     [min-width 50]
                     [min-height 30]
                     [vert-margin 5]
                     [horiz-margin 30]))

(define start-calculus (new button%
                             [parent my-window]
                             [label "Calcular"]
                             [min-width 100]
                             [min-height 30]
                             [vert-margin 25]
                             [horiz-margin 10]
                             [callback (lambda (button event)
                  (write-file "teste.txt"  ( ~a "\nA " (string->number (send a-input get-value))
                                             "\nB " (string->number (send b-input get-value))
                                             "\nC " (string->number (send c-input get-value))
                                           "\neixo X  "(findXv(string->number (send a-input get-value)) (string->number (send b-input get-value)))
                                           "\neixo Y " (findYv (string->number (send a-input get-value)) (string->number (send b-input get-value)) (string->number (send c-input get-value)))
                                           "\nBhaskara "( bhaskara (string->number (send a-input get-value)) (string->number (send b-input get-value)) (string->number (send c-input get-value)))))
                  (display (~a "\neixo X  "))
                  (display (show-Xv(string->number (send a-input get-value))   (string->number (send b-input get-value))))
                  (display (~a "\neixo Y  "))
                  (display (show-Yv (string->number (send a-input get-value))   (string->number (send b-input get-value)) (string->number (send c-input get-value))))    
                  (display (~a "\nbhaskara  "))
                  (display( show-results (string->number (send a-input get-value))   (string->number (send b-input get-value)) (string->number (send c-input get-value)))))]))
                            
(send my-window show #t)



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
