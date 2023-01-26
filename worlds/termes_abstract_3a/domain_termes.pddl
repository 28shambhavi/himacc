(define (domain blocksworld)
  (:requirements :strips :typing :equality :negative-preconditions :universal-preconditions :disjunctive-preconditions)

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
    agent - object
)
(:predicates
    (height ?p - position ?h - numb)
    (has-block ?a - agent)
    (SUCC ?n1 - numb ?n2 - numb)
    (NEIGHBOR ?p1 - position ?p2 - position)
    (IS-DEPOT ?p - position)
)

(:action place-block
    :parameters (?a - agent ?bpos - position ?n1 - position ?hbefore - numb ?hafter - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hafter ?hbefore)
        (has-block ?a)
        (not (IS-DEPOT ?bpos))
        ; true if any of the neighbors of bpos has height hbefore
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hbefore))
    )                
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        (not (has-block ?a))
    )
)

(:action remove-block
    :parameters (?a - agent ?bpos - position ?hbefore - numb ?hafter - numb)
    :precondition
    (and
        ;(NEIGHBOR ?rpos ?bpos)
        ;(height ?rpos ?hafter)
        (height ?bpos ?hbefore)
        (SUCC ?hbefore ?hafter)
        (not (has-block ?a))
    )
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        (has-block ?a)
    )
)

(:action create-block
    :parameters (?a - agent ?p - position)
    :precondition
    (and
        (not (has-block ?a))
        (IS-DEPOT ?p)
    )
    :effect
    (and
        (has-block ?a)
    )
)

(:action destroy-block
    :parameters (?a - agent ?p - position)
    :precondition
    (and
        (has-block ?a)
        (IS-DEPOT ?p)
    )
    :effect
    (and
        (not (has-block ?a))
    )
)

)
