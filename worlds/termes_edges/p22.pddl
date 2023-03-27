(define (problem termes-00072-0048-4x3x4-random_towers_4x3_4_1_12)
(:domain termes)
; termes-00072-0048-4x3x4-random_towers_4x3_4_1_12
; Initial state:
;  0   0   0   0
;  0   0   0   0
;  0   0   0   0
; Goal state:
;  0   0   0   0
;  4   0   0   5
;  0   0   0   0
; Maximal height: 4

(:objects
    n0 - numb
    n1 - numb
    n2 - numb
    n3 - numb
    n4 - numb
    n5 - numb
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
    (SUCC n4 n3)
    (SUCC n5 n4)
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
    ; (= (block_cost pos-0-0) 0.32)
    ; (= (block_cost pos-0-1) 0)
    ; (= (block_cost pos-0-2) 0.32)
    ; (= (block_cost pos-1-0) 0.35)
    ; (= (block_cost pos-1-1) 0.03)
    ; (= (block_cost pos-1-2) 0.35)
    ; (= (block_cost pos-2-0) 0.39)
    ; (= (block_cost pos-2-1) 0.07)
    ; (= (block_cost pos-2-2) 0.39)
    ; (= (block_cost pos-3-0) 0.42)
    ; (= (block_cost pos-3-1) 0.11)
    ; (= (block_cost pos-3-2) 0.42)
    ; (= (path_cost pos-0-0) 0.001)
    ; (= (path_cost pos-0-1) 0.001)
    ; (= (path_cost pos-0-2) 0.001)
    ; (= (path_cost pos-1-0) 0.001)
    ; (= (path_cost pos-1-1) 0.002)
    ; (= (path_cost pos-1-2) 0.001)
    ; (= (path_cost pos-2-0) 0.001)
    ; (= (path_cost pos-2-1) 0.001)
    ; (= (path_cost pos-2-2) 0.002)
    ; (= (path_cost pos-3-0) 0.001)
    ; (= (path_cost pos-3-1) 0.001)
    ; (= (path_cost pos-3-2) 0.001)
    (= (block_cost pos-0-0) 1)
    (= (block_cost pos-0-1) 1)
    (= (block_cost pos-0-2) 1)
    (= (block_cost pos-1-0) 1)
    (= (block_cost pos-1-1) 1)
    (= (block_cost pos-1-2) 1)
    (= (block_cost pos-2-0) 1)
    (= (block_cost pos-2-1) 1)
    (= (block_cost pos-2-2) 1)
    (= (block_cost pos-3-0) 1)
    (= (block_cost pos-3-1) 1)
    (= (block_cost pos-3-2) 1)
    (= (path_cost pos-0-0) 0)
    (= (path_cost pos-0-1) 0)
    (= (path_cost pos-0-2) 0)
    (= (path_cost pos-1-0) 0)
    (= (path_cost pos-1-1) 0)
    (= (path_cost pos-1-2) 0)
    (= (path_cost pos-2-0) 0)
    (= (path_cost pos-2-1) 0)
    (= (path_cost pos-2-2) 0)
    (= (path_cost pos-3-0) 0)
    (= (path_cost pos-3-1) 0)
    (= (path_cost pos-3-2) 0)
    (= (total-cost) 0)
)
(:goal
(and
    (height pos-0-0 n0)
    (height pos-0-1 n4)
    (height pos-0-2 n0)
    (height pos-1-0 n0)
    (height pos-1-1 n0)
    (height pos-1-2 n0)
    (height pos-2-0 n0)
    (height pos-2-1 n0)
    (height pos-2-2 n0)
    (height pos-3-0 n0)
    (height pos-3-1 n5)
    (height pos-3-2 n0)
)
)
(:metric minimize (total-cost))
)
