(define (domain blocksworld)
  (:requirements :strips :typing :equality :negative-preconditions :universal-preconditions :disjunctive-preconditions :fluents)

; types location and agent

; predicates 
; block is at location l
; block is on block
; block is clear
; agent a is holding block

; actions

; pick up block b from location l
    ;precondtions
    ;block is at location l
    ;block is clear
    ;agent a is not holding 

    ;effect
    ;agent a is holding

; put down block b at location l

(:types
    numb - object ;number of blocks, represents height
    position - object ;position of a block
)
(:predicates
    (height ?p - position ?h - numb)
    (has-block)
    (SUCC ?n1 - numb ?n2 - numb)
    (NEIGHBOR ?p1 - position ?p2 - position)
    (IS-DEPOT ?p - position)
)

(:functions
   (block_cost ?p - position)
   (total_cost)
   )


(:action place-block
    :parameters (?bpos - position ?n1 - position ?hbefore - numb ?hafter - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hafter ?hbefore)
        (has-block)
        (not (IS-DEPOT ?bpos))
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hbefore))
        ; true if any of the neighbors of bpos has height hbefore
    )                
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        (not (has-block))
        (increase (total_cost) (block_cost ?bpos))
    )
)

(:action remove-block
    :parameters (?bpos - position ?hbefore - numb ?hafter - numb)
    :precondition
    (and
        ;(NEIGHBOR ?rpos ?bpos)
        ;(height ?rpos ?hafter)
        (height ?bpos ?hbefore)
        (SUCC ?hbefore ?hafter)
        (not (has-block))
        
    )
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        (has-block)
        (increase (total_cost) 0)
    )
)

(:action create-block
    :parameters (?p - position)
    :precondition
    (and
        (not (has-block))
        (IS-DEPOT ?p)
    )
    :effect
    (and
        (has-block)
        (increase (total_cost) 0)
    )
)

(:action destroy-block
    :parameters (?p - position)
    :precondition
    (and
        (has-block)
        (IS-DEPOT ?p)
    )
    :effect
    (and
        (not (has-block))
        (increase (total_cost) 0)
    )
)
)
