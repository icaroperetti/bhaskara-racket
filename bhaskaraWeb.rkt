;Documentacoes Utilizadas: https://docs.racket-lang.org/continue/, https://docs.racket-lang.org/web-server/run.html
;http://matt.might.net/articles/low-level-web-in-racket/  

; biblioteca
#lang racket

; biblioteca web
(require web-server/servlet
         web-server/servlet-env)
(require net/uri-codec)

; Iniciar web
(define (bhaskara-web req)
  
  ; definicoes para pegar dados do form e enviar para a outra pagina
(define uri (request-uri req))
(define path (map path/param-path (url-path uri)))    
(define page (car path))
  
  (cond 
    [(equal? page "index") ; pagina 1
  
     (response/xexpr
      `(html
        (head (title "Bhaskara - Icaro e Eduardo"))
        (body (center(h1  "Calcular Bhaskara")
               (center(h1 "Paradigmas da Computação"))
           (p "Programa para calcular equações do segundo grau.")
           (p "Alunos: Ícaro Peretti e Eduardo Rampon Meireles")
           (p "Digite os valores de A, B e C (caso não tenha o valor de um deles,digite 1 ou -1(se for negativo) no lugar):")
           
           ;envia via post para a pagina resultado
           (form ([method "POST"] [action "/resultado"])
               " A  " (input ([type "number"] [name "a"]))
               (br)
               (br)
               " B  " (input ([type "number"] [name "b"]))
                (br)
                (br)
               " C  " (input ([type "number"] [name "c"]))
               (br)
               (br)
               (input ([type "submit"] [value "Calcular"])))))))] 
   
    [(equal? page "resultado") ;pagina dos resultados
  
     ; Pegar dados do formulário:
     (define post-data (bytes->string/utf-8 (request-post-data/raw req)))
     (define form-data (form-urlencoded->alist post-data))

     ; Definir variaveis recebidas dos campos
     (define a (string->number(cdr (assq 'a form-data))))
     (define b (string->number(cdr (assq 'b form-data))))
     (define c (string->number(cdr (assq 'c form-data))))

     ;Calculo do delta
     (define delta (- (expt b 2) (* 4 a c)))
     
     ; Calculo das raizes
     (define x1 (/ (+ (- b) (sqrt delta)) (* 2 a)))
     (define x2 (/ (- (- b) (sqrt delta)) (* 2 a)))
     
     ; Calculo dos vertices
     (define vX(/ ( - b )(* 2 a)))
     (define vY (/ (-(-( expt b 2) ( * 4 a c))) (* 4 a)))

     ; imprimir os dados
     (response/xexpr
      `(html
        (head (title "Bhaskara - Icaro e Eduardo") )
        
        (body (center(h1  "Resultados")
         (p "Delta = ", (number->string delta))
         (p "X1 = " , (number->string x1))
         (p "X2 = " , (number->string x2))
         (p "Vertice X = " , (number->string vX))
         (p "Vertice Y = " , (number->string vY))
         (input ([type "button"] [value "Voltar"][onclick "location.href='/index'"]))
         (br) ))))]
     ; pagina nao foi encontrada
    [else    
     (response/xexpr
      `(html
        (body
         (p "Pagina não encontrada"))))]))

; Configurar web
(serve/servlet bhaskara-web
                #:servlet-path "/index"
                #:port 8000 ;porta que a pagina ira rodar
                #:servlet-regexp #rx""
)
