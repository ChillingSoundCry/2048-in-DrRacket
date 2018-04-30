;(sleep 2)
;(random 5)
;list的set!-car在racket中用不了
#lang racket
(require racket/vector)
(define map (vector 0 0 0 0 0 0 0 0 0))
(define (drew n) (begin (display (vector-ref map n)) ;变量n用于递归记次,调用时填0
                      (if (or (= n 2) (= n 5) (= n 8))
                        (begin (newline)
                        (when (or (= n 2) (= n 5))
                        (drew (+ n 1))))
                        (drew (+ n 1))
                        )))
(define (setnum) (let ((ptr (random 9))) (if (= (vector-ref map ptr) 0) (vector-set! map ptr 2) (setnum))))
(define (up n)(begin (set! n 0) (cond ((or (= n 0) (= n 1) (= n 2));变量n用于递归记次,调用时填0
                                            (cond ((= (vector-ref map n) 0) (vector-set! map n (vector-ref map (+ n 3))))
                                                  ((= (vector-ref map n) (vector-ref map (+ n 3))) (vector-set! map n (+ (vector-ref map n) (vector-ref map (+ n 3)))))))
                                       ((or (= n 3) (= n 4) (= n 5))
                                            (cond ((= (vector-ref map n) 0) (vector-set! map n (vector-ref map (+ n 3))))
                                                  ((= (vector-ref map n) (vector-ref map (+ n 3))) (vector-set! map n (+ (vector-ref map n) (vector-ref map (+ n 3))))))))
                     (up (+ n 1))))

(define (play) (λ (sg) (begin (set! sg (read))
                              (cond ((= sg "w") (up)) ((= sg "s") (down)) ((= sg "a") (lift)) ((= sg "d") (right)))
                              (setnum) (drew 0) (play))))  
(define (game-begin) (begin
(setnum)
(setnum)
(drew 0)))

(game-begin)

