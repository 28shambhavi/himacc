(define (problem termes-00102-0048-4x3x4-random_towers_4x3_4_2_15)
(:domain termes)
; termes-00102-0048-4x3x4-random_towers_4x3_4_2_15
; Initial state:
;  0  R0D  0   0
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
    (height pos-0-3 n0)
    (height pos-0-4 n0)
    (height pos-1-0 n0)
    (height pos-1-1 n0)
    (height pos-1-2 n0)
    (height pos-1-3 n0)
    (height pos-1-4 n0)
    (height pos-2-0 n0)
    (height pos-2-1 n0)
    (height pos-2-2 n0)
    (height pos-2-3 n0)
    (height pos-2-4 n0)
    (height pos-3-0 n0)
    (height pos-3-1 n0)
    (height pos-3-2 n0)
    (height pos-3-3 n0)
    (height pos-3-4 n0)
    (height pos-4-0 n0)
    (height pos-4-1 n0)
    (height pos-4-2 n0)
    (height pos-4-3 n0)
    (height pos-4-4 n0)
    (height pos-5-0 n0)
    (height pos-5-1 n0)
    (height pos-5-2 n0)
    (height pos-5-3 n0)
    (height pos-5-4 n0)
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
    (NEIGHBOR pos-0-2 pos-0-3)
    (NEIGHBOR pos-0-3 pos-1-3)
    (NEIGHBOR pos-0-3 pos-0-2)
    (NEIGHBOR pos-0-3 pos-0-4)
    (NEIGHBOR pos-0-4 pos-1-4)
    (NEIGHBOR pos-0-4 pos-0-3)
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
    (NEIGHBOR pos-1-2 pos-1-3)
    (NEIGHBOR pos-1-3 pos-0-3)
    (NEIGHBOR pos-1-3 pos-2-3)
    (NEIGHBOR pos-1-3 pos-1-2)
    (NEIGHBOR pos-1-3 pos-1-4)
    (NEIGHBOR pos-1-4 pos-0-4)
    (NEIGHBOR pos-1-4 pos-2-4)
    (NEIGHBOR pos-1-4 pos-1-3)
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
    (NEIGHBOR pos-2-2 pos-2-3)
    (NEIGHBOR pos-2-3 pos-1-3)
    (NEIGHBOR pos-2-3 pos-3-3)
    (NEIGHBOR pos-2-3 pos-2-2)
    (NEIGHBOR pos-2-3 pos-2-4)
    (NEIGHBOR pos-2-4 pos-1-4)
    (NEIGHBOR pos-2-4 pos-3-4)
    (NEIGHBOR pos-2-4 pos-2-3)
    (NEIGHBOR pos-3-0 pos-2-0)
    (NEIGHBOR pos-3-0 pos-3-1)
    (NEIGHBOR pos-3-0 pos-4-0)
    (NEIGHBOR pos-3-1 pos-2-1)
    (NEIGHBOR pos-3-1 pos-3-0)
    (NEIGHBOR pos-3-1 pos-3-2)
    (NEIGHBOR pos-3-1 pos-4-1)
    (NEIGHBOR pos-3-2 pos-2-2)
    (NEIGHBOR pos-3-2 pos-3-1)
    (NEIGHBOR pos-3-2 pos-3-3)
    (NEIGHBOR pos-3-2 pos-4-2)
    (NEIGHBOR pos-3-3 pos-2-3)
    (NEIGHBOR pos-3-3 pos-3-2)
    (NEIGHBOR pos-3-3 pos-3-4)
    (NEIGHBOR pos-3-3 pos-4-3)
    (NEIGHBOR pos-3-4 pos-2-4)
    (NEIGHBOR pos-3-4 pos-3-3)
    (NEIGHBOR pos-3-4 pos-4-4)
    (NEIGHBOR pos-3-4 pos-2-4)
    (NEIGHBOR pos-4-0 pos-4-1)
    (NEIGHBOR pos-4-1 pos-4-0)
    (NEIGHBOR pos-4-1 pos-4-2)
    (NEIGHBOR pos-4-1 pos-3-1)
    (NEIGHBOR pos-4-1 pos-5-1)
    (NEIGHBOR pos-4-2 pos-4-1)
    (NEIGHBOR pos-4-2 pos-4-3)
    (NEIGHBOR pos-4-2 pos-3-2)
    (NEIGHBOR pos-4-2 pos-5-2)
    (NEIGHBOR pos-4-3 pos-4-2)
    (NEIGHBOR pos-4-3 pos-4-4)
    (NEIGHBOR pos-4-3 pos-3-3)
    (NEIGHBOR pos-4-3 pos-5-3)
    (NEIGHBOR pos-4-4 pos-4-3)
    (NEIGHBOR pos-4-4 pos-5-4)
    (NEIGHBOR pos-4-4 pos-3-4)
    (NEIGHBOR pos-5-0 pos-5-1)
    (NEIGHBOR pos-5-0 pos-4-0)
    (NEIGHBOR pos-5-1 pos-5-0)
    (NEIGHBOR pos-5-1 pos-5-2)
    (NEIGHBOR pos-5-1 pos-4-1)
    (NEIGHBOR pos-5-2 pos-5-1)
    (NEIGHBOR pos-5-2 pos-5-3)
    (NEIGHBOR pos-5-2 pos-4-2)
    (NEIGHBOR pos-5-3 pos-5-2)
    (NEIGHBOR pos-5-3 pos-5-4)
    (NEIGHBOR pos-5-3 pos-4-3)
    (NEIGHBOR pos-5-4 pos-5-3)
    (NEIGHBOR pos-5-4 pos-4-4)
    (= (block_cost pos-0-0) 1)
    (= (block_cost pos-0-1) 1)
    (= (block_cost pos-0-2) 1)
    (= (block_cost pos-0-3) 1)
    (= (block_cost pos-0-4) 1)
    (= (block_cost pos-1-0) 1)
    (= (block_cost pos-1-1) 1)
    (= (block_cost pos-1-2) 1)
     (= (block_cost pos-1-3) 1)
    (= (block_cost pos-1-4) 1)
    (= (block_cost pos-2-0) 1)
    (= (block_cost pos-2-1) 1)
    (= (block_cost pos-2-2) 1)
     (= (block_cost pos-2-3) 1)
    (= (block_cost pos-2-4) 1)
    (= (block_cost pos-3-0) 1)
    (= (block_cost pos-3-1) 1)
    (= (block_cost pos-3-2) 1)
     (= (block_cost pos-3-3) 1)
    (= (block_cost pos-3-4) 1)
     (= (block_cost pos-4-0) 1)
    (= (block_cost pos-4-1) 1)
    (= (block_cost pos-4-2) 1)
     (= (block_cost pos-4-3) 1)
    (= (block_cost pos-4-4) 1)
    (= (block_cost pos-5-0) 1)
    (= (block_cost pos-5-1) 1)
    (= (block_cost pos-5-2) 1)
     (= (block_cost pos-5-3) 1)
    (= (block_cost pos-5-4) 1)
    (= (path_cost pos-0-0) 0)
    (= (path_cost pos-0-1) 0)
    (= (path_cost pos-0-2) 0)
    (= (path_cost pos-0-3) 0)
    (= (path_cost pos-0-4) 0)
    (= (path_cost pos-1-0) 0)
    (= (path_cost pos-1-1) 0)
    (= (path_cost pos-1-2) 0)
     (= (path_cost pos-1-3) 0)
    (= (path_cost pos-1-4) 0)
    (= (path_cost pos-2-0) 0)
    (= (path_cost pos-2-1) 0)
    (= (path_cost pos-2-2) 0)
     (= (path_cost pos-2-3) 0)
    (= (path_cost pos-2-4) 0)
    (= (path_cost pos-3-0) 0)
    (= (path_cost pos-3-1) 0)
    (= (path_cost pos-3-2) 0)
     (= (path_cost pos-3-3) 0)
    (= (path_cost pos-3-4) 0)
     (= (path_cost pos-4-0) 0)
    (= (path_cost pos-4-1) 0)
    (= (path_cost pos-4-2) 0)
     (= (path_cost pos-4-3) 0)
    (= (path_cost pos-4-4) 0)
    (= (path_cost pos-5-0) 0)
    (= (path_cost pos-5-1) 0)
    (= (path_cost pos-5-2) 0)
     (= (path_cost pos-5-3) 0)
    (= (path_cost pos-5-4) 0)
    (= (total_cost) 0)
    
)
(:goal
(and
    (height pos-0-0 n1)
    ; (height pos-0-1 n0)
    ; (height pos-0-2 n0)
    (height pos-0-3 n1)
    (height pos-0-4 n0)
    (height pos-1-0 n2)
    (height pos-1-1 n0)
    (height pos-1-2 n2)
    (height pos-1-3 n1)
    (height pos-1-4 n0)
    (height pos-2-0 n2)
    ; (height pos-2-1 n0)
    (height pos-2-2 n1)
    (height pos-2-3 n0)
    ; (height pos-2-4 n2)
    ; (height pos-3-0 n1)
    ; (height pos-3-1 n1)
    ; (height pos-3-2 n2)
    ; (height pos-3-3 n1)
    ; (height pos-3-4 n1)
    ; ; (height pos-4-0 n0)
    ; (height pos-4-1 n2)
    ; (height pos-4-2 n1)
    ; (height pos-4-3 n1)
    ; (height pos-4-4 n1)
    ; (height pos-5-0 n0)
    ; (height pos-5-1 n0)
    ; (height pos-5-2 n0)
    ; (height pos-5-3 n0)
    ; (height pos-5-4 n0)
)
)
(:metric minimize (total_cost)
)
)