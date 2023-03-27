(define (domain blocksworld)
  (:requirements :strips :typing :equality :negative-preconditions :universal-preconditions :disjunctive-preconditions :fluents :derived-predicates :conditional-effects :action-costs)


(:types
    numb - object ;number of blocks, represents height
    position - object ;position of a block
)

(:predicates
    (height ?p - position ?h - numb)
    (SUCC ?n1 - numb ?n2 - numb)
    (NEIGHBOR ?p1 - position ?p2 - position)
)

(:functions
   (block_cost ?p - position)
   (path_cost ?p - position)
   (total-cost)
   )

; (:derived (path ?p - position ?hbefore - numb)
;     (and 
;         (exists (?n1 - position)
;             (and
;                 (NEIGHBOR ?p ?n1)
;                 (height ?n1 ?hbefore)
;             )
;         )
;     )
; )

; (:derived (path ?n1 - position)
;     (and 
;         (exists (?n2 - position)
;             (and
;                 (NEIGHBOR ?n1 ?n2)
;             )
;         )
;     )
    ; (and 
    ; (exists (?npos - position)
    ;     (and (NEIGHBOR ?p ?npos))
    ; )
                ; (exists (?hn - numb)
                ;     (and
                ;         (height ?npos ?hn)
                ;         (SUCC ?hp ?hn)
                ;         (path ?npos ?hn))

(:action place-block
    :parameters (?bpos - position ?n1 - position ?hafter - numb ?hbefore - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hafter ?hbefore)
        ;(has-block)
        ;(not (IS-DEPOT ?bpos))
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hbefore))
        ; (exists (?n2 - position)
        ;     (and
        ;         (NEIGHBOR ?n1 ?n2)
        ;         (exists (?hn - numb)
        ;             (and
        ;                 (height ?n2 ?hn)
        ;                 (or 
        ;                     ;height is n0
        ;                     (forall (?heights - numb)
        ;                         (and (not (SUCC ?hn ?heights)))
        ;                     )

        ;                 )
        ;             )
        ;     )
        ; )
        ; )
        ; (path ?n1)
    )
        ; true if any of the neighbors of bpos has height hbefor                
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        ;(not (has-block))
        (increase (total-cost) (+
        (block_cost ?bpos)
        (path_cost ?n1)
        )
        )
    )
)

(:action remove-block
    :parameters (?bpos - position ?n1 - position ?hbefore - numb ?hafter - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hbefore ?hafter)
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hafter))
    )
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        ;increase cost by 1- block_cost ?bpos
        (increase (total-cost) 
            (+
            (- 1 (block_cost ?bpos))
            (path_cost ?n1)
            )
        )
    )
)
)

; (:derived (path ?p - position ?hbefore - numb)
;     (and 
;         (exists (?n1 - position)
;             (and
;                 (NEIGHBOR ?p ?n1)
;                 (height ?n1 ?hbefore)
;             )
;         )
;     )
; )

; (:derived (path ?n1 - position)
;     (and 
;         (exists (?n2 - position)
;             (and
;                 (NEIGHBOR ?n1 ?n2)
;             )
;         )
;     )
    ; (and 
    ; (exists (?npos - position)
    ;     (and (NEIGHBOR ?p ?npos))
    ; )
                ; (exists (?hn - numb)
                ;     (and
                ;         (height ?npos ?hn)
                ;         (SUCC ?hp ?hn)
                ;         (path ?npos ?hn))