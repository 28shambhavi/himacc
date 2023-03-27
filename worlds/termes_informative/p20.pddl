(define (problem termes-00164-0048-4x3x4-random_towers_4x3_4_6_78)
(:domain termes)
; termes-00164-0048-4x3x4-random_towers_4x3_4_6_78
; Initial state:
;  0   0  R0D  0
;  0   0   0   0
;  0   0   0   0
; Goal state:
;  4   4   0   2
;  0   2   0   0
;  2   0   0   2
; Maximal height: 4


(:objects
    n0 - numb
    n1 - numb
    n2 - numb
    n3 - numb
    n4 - numb
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
    (at pos-1-0)
    (SUCC n1 n0)
    (SUCC n2 n1)
    (SUCC n3 n2)
    (SUCC n4 n3)
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
    (= (block_cost pos-0-0) 0.22)
    (= (block_cost pos-0-1) 0)
    (= (block_cost pos-0-2) 0.22)
    (= (block_cost pos-1-0) 0)
    (= (block_cost pos-1-1) 0)
    (= (block_cost pos-1-2) 0.22)
    (= (block_cost pos-2-0) 0.22)
    (= (block_cost pos-2-1) 0.44)
    (= (block_cost pos-2-2) 0.66)
    (= (block_cost pos-3-0) 0.22)
    (= (block_cost pos-3-1) 0.44)
    (= (block_cost pos-3-2) 0.55)
    (= (path_cost pos-0-0) 0.01)
    (= (path_cost pos-0-1) 0.01)
    (= (path_cost pos-0-2) 0.01)
    (= (path_cost pos-1-0) 0.01)
    (= (path_cost pos-1-1) 0.02)
    (= (path_cost pos-1-2) 0.01)
    (= (path_cost pos-2-0) 0.01)
    (= (path_cost pos-2-1) 0.01)
    (= (path_cost pos-2-2) 0.02)
    (= (path_cost pos-3-0) 0.01)
    (= (path_cost pos-3-1) 0.01)
    (= (path_cost pos-3-2) 0.01)
    (= (total-cost) 0)
    (IS-DEPOT pos-2-0)
)
(:goal
(and
    (height pos-0-0 n4)
    (height pos-0-1 n0)
    (height pos-0-2 n2)
    (height pos-1-0 n4)
    (height pos-1-1 n2)
    (height pos-1-2 n0)
    (height pos-2-0 n0)
    (height pos-2-1 n0)
    (height pos-2-2 n0)
    (height pos-3-0 n2)
    (height pos-3-1 n0)
    (height pos-3-2 n2)
)
)
)





; (:objects
;     n0 - numb
;     n1 - numb
;     n2 - numb
;     n3 - numb
;     n4 - numb
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
;     (SUCC n4 n3)
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
;     (= (block_cost pos-0-0) 0.22)
;     (= (block_cost pos-0-1) 0)
;     (= (block_cost pos-0-2) 0.22)
;     (= (block_cost pos-1-0) 0)
;     (= (block_cost pos-1-1) 0)
;     (= (block_cost pos-1-2) 0.22)
;     (= (block_cost pos-2-0) 0.22)
;     (= (block_cost pos-2-1) 0.44)
;     (= (block_cost pos-2-2) 0.66)
;     (= (block_cost pos-3-0) 0.22)
;     (= (block_cost pos-3-1) 0.44)
;     (= (block_cost pos-3-2) 0.55)
;     (= (path_cost pos-0-0) 0.1)
;     (= (path_cost pos-0-1) 0.1)
;     (= (path_cost pos-0-2) 0.1)
;     (= (path_cost pos-1-0) 0.1)
;     (= (path_cost pos-1-1) 0.2)
;     (= (path_cost pos-1-2) 0.1)
;     (= (path_cost pos-2-0) 0.1)
;     (= (path_cost pos-2-1) 0.1)
;     (= (path_cost pos-2-2) 0.2)
;     (= (path_cost pos-3-0) 0.1)
;     (= (path_cost pos-3-1) 0.1)
;     (= (path_cost pos-3-2) 0.1)
;     (= (total_cost) 0)
;     (IS-DEPOT pos-2-0)
; )
; (:goal
; (and
;     (height pos-0-0 n4)
;     (height pos-0-1 n0)
;     (height pos-0-2 n2)
;     (height pos-1-0 n4)
;     (height pos-1-1 n2)
;     (height pos-1-2 n0)
;     (height pos-2-0 n0)
;     (height pos-2-1 n0)
;     (height pos-2-2 n0)
;     (height pos-3-0 n2)
;     (height pos-3-1 n0)
;     (height pos-3-2 n2)
; )
; )
; (:metric minimize (total_cost)
; )

; )
