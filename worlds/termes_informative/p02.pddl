(define (problem termes-00112-0036-4x3x3-random_towers_4x3_3_2_8)
(:domain termes)
; termes-00112-0036-4x3x3-random_towers_4x3_3_2_8
; Initial state:
;  0   0  R0D  0
;  0   0   0   0
;  0   0   0   0
; Goal state:
;  0   0   0   3
;  0   0   3   0
;  0   0   0   0
; Maximal height: 3

(:objects
    n0 - numb
    n1 - numb
    n2 - numb
    n3 - numb
    pos-0-0 - position
    pos-0-1 - position
    pos-0-2 - position
    pos-1-0 - position
    pos-1-1 - position
    pos-1-2 - position
    pos-2-0 - position
    pos-2-1 - position
    pos-2-2 - position
    pos-3-0 - position
    pos-3-1 - position
    pos-3-2 - position
)
(:init
    (height pos-0-0 n0)
    (height pos-0-1 n0)
    (height pos-0-2 n0)
    (height pos-1-0 n0)
    (height pos-1-1 n0)
    (height pos-1-2 n0)
    (height pos-2-0 n0)
    (height pos-2-1 n0)
    (height pos-2-2 n0)
    (height pos-3-0 n0)
    (height pos-3-1 n0)
    (height pos-3-2 n0)
    (SUCC n1 n0)
    (SUCC n2 n1)
    (SUCC n3 n2)
    (NEIGHBOR pos-0-0 pos-1-0)
    (NEIGHBOR pos-0-0 pos-0-1)
    (NEIGHBOR pos-0-1 pos-1-1)
    (NEIGHBOR pos-0-1 pos-0-0)
    (NEIGHBOR pos-0-1 pos-0-2)
    (NEIGHBOR pos-0-2 pos-1-2)
    (NEIGHBOR pos-0-2 pos-0-1)
    (NEIGHBOR pos-1-0 pos-0-0)
    (NEIGHBOR pos-1-0 pos-2-0)
    (NEIGHBOR pos-1-0 pos-1-1)
    (NEIGHBOR pos-1-1 pos-0-1)
    (NEIGHBOR pos-1-1 pos-2-1)
    (NEIGHBOR pos-1-1 pos-1-0)
    (NEIGHBOR pos-1-1 pos-1-2)
    (NEIGHBOR pos-1-2 pos-0-2)
    (NEIGHBOR pos-1-2 pos-2-2)
    (NEIGHBOR pos-1-2 pos-1-1)
    (NEIGHBOR pos-2-0 pos-1-0)
    (NEIGHBOR pos-2-0 pos-3-0)
    (NEIGHBOR pos-2-0 pos-2-1)
    (NEIGHBOR pos-2-1 pos-1-1)
    (NEIGHBOR pos-2-1 pos-3-1)
    (NEIGHBOR pos-2-1 pos-2-0)
    (NEIGHBOR pos-2-1 pos-2-2)
    (NEIGHBOR pos-2-2 pos-1-2)
    (NEIGHBOR pos-2-2 pos-3-2)
    (NEIGHBOR pos-2-2 pos-2-1)
    (NEIGHBOR pos-3-0 pos-2-0)
    (NEIGHBOR pos-3-0 pos-3-1)
    (NEIGHBOR pos-3-1 pos-2-1)
    (NEIGHBOR pos-3-1 pos-3-0)
    (NEIGHBOR pos-3-1 pos-3-2)
    (NEIGHBOR pos-3-2 pos-2-2)
    (NEIGHBOR pos-3-2 pos-3-1)
    (= (block_cost pos-0-0) 2)
    (= (block_cost pos-0-1) 2)
    (= (block_cost pos-0-2) 2.666)
    (= (block_cost pos-1-0) 1.333)
    (= (block_cost pos-1-1) 1.333)
    (= (block_cost pos-1-2) 2)
    (= (block_cost pos-2-0) 0.666)
    (= (block_cost pos-2-1) 0.666)
    (= (block_cost pos-2-2) 1.333)
    (= (block_cost pos-3-0) 0.666)
    (= (block_cost pos-3-1) 0.666)
    (= (block_cost pos-3-2) 1.333)
    (= (total_cost) 0)
    (IS-DEPOT pos-2-0)
    (not (has-block))
)
(:goal
(and
    (height pos-0-0 n0)
    (height pos-0-1 n0)
    (height pos-0-2 n0)
    (height pos-1-0 n0)
    (height pos-1-1 n0)
    (height pos-1-2 n0)
    (height pos-2-0 n0)
    (height pos-2-1 n3)
    (height pos-2-2 n0)
    (height pos-3-0 n3)
    (height pos-3-1 n0)
    (height pos-3-2 n0)
    (not (has-block))
)
)
(:metric minimize (total_cost)
)

)

; (:objects
;     n0 - numb
;     n1 - numb
;     n2 - numb
;     n3 - numb
;     pos-0-0 - position
;     pos-0-1 - position
;     pos-0-2 - position
;     pos-1-0 - position
;     pos-1-1 - position
;     pos-1-2 - position
;     pos-2-0 - position
;     pos-2-1 - position
;     pos-2-2 - position
;     pos-3-0 - position
;     pos-3-1 - position
;     pos-3-2 - position
; )
; (:init
;     (height pos-0-0 n0)
;     (height pos-0-1 n0)
;     (height pos-0-2 n0)
;     (height pos-1-0 n0)
;     (height pos-1-1 n0)
;     (height pos-1-2 n0)
;     (height pos-2-0 n0)
;     (height pos-2-1 n0)
;     (height pos-2-2 n0)
;     (height pos-3-0 n0)
;     (height pos-3-1 n0)
;     (height pos-3-2 n0)
;     (SUCC n1 n0)
;     (SUCC n2 n1)
;     (SUCC n3 n2)
;     (NEIGHBOR pos-0-0 pos-1-0)
;     (NEIGHBOR pos-0-0 pos-0-1)
;     (NEIGHBOR pos-0-1 pos-1-1)
;     (NEIGHBOR pos-0-1 pos-0-0)
;     (NEIGHBOR pos-0-1 pos-0-2)
;     (NEIGHBOR pos-0-2 pos-1-2)
;     (NEIGHBOR pos-0-2 pos-0-1)
;     (NEIGHBOR pos-1-0 pos-0-0)
;     (NEIGHBOR pos-1-0 pos-2-0)
;     (NEIGHBOR pos-1-0 pos-1-1)
;     (NEIGHBOR pos-1-1 pos-0-1)
;     (NEIGHBOR pos-1-1 pos-2-1)
;     (NEIGHBOR pos-1-1 pos-1-0)
;     (NEIGHBOR pos-1-1 pos-1-2)
;     (NEIGHBOR pos-1-2 pos-0-2)
;     (NEIGHBOR pos-1-2 pos-2-2)
;     (NEIGHBOR pos-1-2 pos-1-1)
;     (NEIGHBOR pos-2-0 pos-1-0)
;     (NEIGHBOR pos-2-0 pos-3-0)
;     (NEIGHBOR pos-2-0 pos-2-1)
;     (NEIGHBOR pos-2-1 pos-1-1)
;     (NEIGHBOR pos-2-1 pos-3-1)
;     (NEIGHBOR pos-2-1 pos-2-0)
;     (NEIGHBOR pos-2-1 pos-2-2)
;     (NEIGHBOR pos-2-2 pos-1-2)
;     (NEIGHBOR pos-2-2 pos-3-2)
;     (NEIGHBOR pos-2-2 pos-2-1)
;     (NEIGHBOR pos-3-0 pos-2-0)
;     (NEIGHBOR pos-3-0 pos-3-1)
;     (NEIGHBOR pos-3-1 pos-2-1)
;     (NEIGHBOR pos-3-1 pos-3-0)
;     (NEIGHBOR pos-3-1 pos-3-2)
;     (NEIGHBOR pos-3-2 pos-2-2)
;     (NEIGHBOR pos-3-2 pos-3-1)
;     (= (block_cost pos-0-0) 2)
;     (= (block_cost pos-0-1) 2)
;     (= (block_cost pos-0-2) 2.666)
;     (= (block_cost pos-1-0) 1.333)
;     (= (block_cost pos-1-1) 1.333)
;     (= (block_cost pos-1-2) 2)
;     (= (block_cost pos-2-0) 0.666)
;     (= (block_cost pos-2-1) 0.666)
;     (= (block_cost pos-2-2) 1.333)
;     (= (block_cost pos-3-0) 0.666)
;     (= (block_cost pos-3-1) 0.666)
;     (= (block_cost pos-3-2) 1.333)
;     (= (total-cost) 0)
;     (IS-DEPOT pos-2-0)
;     (not (has-block))
; )
; (:goal
; (and
;     (height pos-0-0 n0)
;     (height pos-0-1 n0)
;     (height pos-0-2 n0)
;     (height pos-1-0 n0)
;     (height pos-1-1 n0)
;     (height pos-1-2 n0)
;     (height pos-2-0 n0)
;     (height pos-2-1 n3)
;     (height pos-2-2 n0)
;     (height pos-3-0 n3)
;     (height pos-3-1 n0)
;     (height pos-3-2 n0)
;     (not (has-block))
; )
; )
; (:metric minimize (total_cost)
; )
; )