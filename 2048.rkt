;(require racket/vector)
;(define map (vector 1 2 3 4 5 6 7 8))
;(display (vector-ref map 0))
;list-tail (return end) 
;(let ((sx 5) (sy 5)) (drew sx sy))
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
(define (U n) (begin (cond ((or (= n 0)(= n 1)(= n 2)) (when (= (vector-ref map n) 0) (begin (vector-set! map n (vector-ref map (+ n 3)))
                                                                                                 (vector-set! map (+ n 3) 0)))
                                                       (when (and (= (vector-ref map n) 0) (= (vector-ref map (+ n 3)) 0)) (begin (vector-set! map n (vector-ref map (+ n 6)))
                                                                                                 (vector-set! map (+ n 6) 0))))
                          ((or (= n 3)(= n 4)(= n 5)) (when (= (vector-ref map n) 0) (begin (vector-set! map n (vector-ref map (+ n 3)))
                                                                                                 (vector-set! map (+ n 3) 0)))))
                     (when (< n 5) (U (+ n 1)))))
                           
(define (up n)(begin (when (= n 0)(U n)) (cond ((or (= n 0) (= n 1) (= n 2));变量n用于递归记次,调用时填0
                                            (cond ((= (vector-ref map n) (vector-ref map (+ n 3))) (begin (vector-set! map n (+ (vector-ref map n) (vector-ref map (+ n 3)))) 
                                                                                                          (vector-set! map (+ n 3) (vector-ref map (+ n 6)))
                                                                                                                   (vector-set! map (+ n 6) 0))))) 
                                                  ;((= (vector-ref map n) (vector-ref map (+ n 3))) (begin (vector-set! map n (+ (vector-ref map n) (vector-ref map (+ n 3)))) 
                                                                                                         ; (vector-set! map (+ n 3) (vector-ref map (+ n 6))
                                                                                                                  ; (vector-set! map (+ n 6) 0)))))
                                       ((or (= n 3) (= n 4) (= n 5))
                                            (cond ((= (vector-ref map n) (vector-ref map (+ n 3))) (begin (vector-set! map n (+ (vector-ref map n) (vector-ref map (+ n 3))))
                                                                                                          (vector-set! map (+ n 3) 0))))))  (if (>= n 5) (newline) (up (+ n 1)))))

(define (play) (let ((sg (read))) (begin (cond ((string=? sg "w") (up 0)) ((string=? sg "s") (up 0)) ((string=? sg "a") (up 0)) ((string=? sg "d") (up 0)))
                              (setnum) (drew 0) (play))))  
(define (game-begin) (begin
        (display "2048 begin:")
        (newline)(newline)
        (setnum)(setnum)
(drew 0)))

(game-begin)
(play)


