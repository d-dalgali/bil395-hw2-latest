(define (eval-add-sub expr)
  (cond
    ((null? expr) 0)
    ((eqv? '+ (car expr)) (eval-add-sub (cdr expr)))
    ((eqv? '- (car expr))
     (eval-add-sub (cons (- (cadr expr)) (cddr expr))))
    (else (+ (car expr) (eval-add-sub (cdr expr))))))

(define (eval-mul-div expr)
  (cond
    ((null? (cdr expr)) expr)
    ((eqv? '* (cadr expr))
     (eval-mul-div (cons (* (car expr) (caddr expr)) (cdddr expr))))
    ((eqv? '/ (cadr expr))
     (eval-mul-div (cons (/ (car expr) (caddr expr)) (cdddr expr))))
    (else (cons (car expr) (eval-mul-div (cdr expr))))))

(define (eval-nested item)
  (if (pair? item)
      (eval-add-sub (eval-mul-div (map eval-nested item)))
      item))

(define (is-valid expr)
  (cond
    ((null? expr) #f)
    ((and (number? (car expr)) (null? (cdr expr))) #t)
    ((and (pair? (car expr)) (null? (cdr expr))) (is-valid (car expr)))
    ((or (eqv? '+ (cadr expr)) (eqv? '- (cadr expr))
         (eqv? '* (cadr expr)) (eqv? '/ (cadr expr)))
     (and
      (if (pair? (car expr)) (is-valid (car expr)) #t)
      (is-valid (cddr expr))))
    (else #f)))

(define (calc expr)
  (if (is-valid expr)
      (eval-add-sub (eval-mul-div (map eval-nested expr)))
      "Hata: Geçersiz ifade"))
