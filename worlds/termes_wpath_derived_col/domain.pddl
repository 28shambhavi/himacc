
(define (domain blocksworld)
  (:requirements :strips :typing :equality :negative-preconditions :universal-preconditions :disjunctive-preconditions :fluents :derived-predicates :conditional-effects :action-costs)

(:types
    numb - object ;number of blocks, represents height
    position - object ;position of a block
    color - object ;colours of blocks    
)

(:predicates
    (height ?p - position ?h - numb)
    (SUCC ?n1 - numb ?n2 - numb)
    (NEIGHBOR ?p1 - position ?p2 - position)
    (reached ?p - position ?h - numb)
    (reached_same ?p - position ?h - numb)
    (has_color ?p - position ?c - color)
)

(:constants 
    ; height of n0
    n0 - numb
    n1 - numb
    n2 - numb
    n3 - numb
    n4 - numb
    n5 - numb
    red - color
    blue - color
    white - color
)

(:functions
   (block_cost ?p - position)
   (path_cost ?p - position)
   (total_cost)
   )


(:derived (reached ?bpos ?h)
    (and 
        (exists (?n1 - position)
            (and (NEIGHBOR ?bpos ?n1)
                (exists (?h1 - numb)
                    (and 
                        (height ?n1 ?h1)
                        (or (and (= ?h n0))
                            (and (= ?h1 n0)(SUCC ?h ?h1))
                            (and (= ?h ?h1)(not (= ?h n0))(reached_same ?n1 ?h1))
                            (and (not(= ?h ?h1))(SUCC ?h ?h1)(reached ?n1 ?h1))
                            ;(and (not(= ?h ?h1))(SUCC ?h ?h1)(not(= ?h1 n0))(reached ?n1 ?h1))
                        )
                        )
                    )
                )
            )
    )
)
(:derived (reached_same ?bpos ?h)
    (and ; bpos is at h1
        (exists (?n1 - position)
            (and (NEIGHBOR ?bpos ?n1)
                (exists (?h1 - numb)
                    (and 
                        (height ?n1 ?h1)
                        (or (and (= ?h n0))
                            (and (= ?h1 n0)(SUCC ?h ?h1))
                            ;(and (= ?h ?h1)(not (= ?h n0))(reached ?n1 ?h1))
                            (and (not(= ?h ?h1))(SUCC ?h ?h1)(reached ?n1 ?h1))
                            ;(and (not(= ?h ?h1))(SUCC ?h ?h1)(not(= ?h1 n0))(reached ?n1 ?h1))
                        )
                        )
                    )
                )
            )
    )
)

(:action place-red-block
    :parameters (?bpos - position ?n1 - position ?hafter - numb ?hbefore - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hafter ?hbefore)
        (exists(?c - color)(and(has_color ?bpos ?c)(not(= ?c blue))))
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hbefore))
        ;(and (not(= ?hafter n0))(reached ?n1 ?hbefore))
        (not 
            (and
                (not(= ?hbefore n0))
                (not(reached ?n1 ?hbefore))
            )
        )
        ;(reached_place ?bpos ?n1 ?hbefore ?hbefore)
    )
        ; true if any of the neighbors of bpos has height hbefor                
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        (has_color ?bpos red)
        (increase (total_cost) (+
        (block_cost ?bpos)
        (path_cost ?n1)
        ))
        
    )
)

(:action remove-red-block
    :parameters (?bpos - position ?n1 - position ?hbefore - numb ?hafter - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hbefore ?hafter)
        (exists(?c - color)(and(has_color ?bpos ?c)(not(= ?c blue))(not(= ?c white))))
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hafter))
        ;(and (not(= ?hafter n0))(reached ?n1 ?hafter))
        (not 
            (and
                (not(= ?hafter n0))
                (not(reached ?n1 ?hafter))
            )
        )
        ;(reached_place ?bpos ?n1 ?hafter ?hafter))
    )
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        (increase (total_cost) (+
            (block_cost ?bpos)
            (path_cost ?n1)
        ))
    )
)

(:action place-blue-block
    :parameters (?bpos - position ?n1 - position ?hafter - numb ?hbefore - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hafter ?hbefore)
        (exists(?c - color)(and(has_color ?bpos ?c)(not(= ?c red))))
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hbefore))
        ;(and (not(= ?hafter n0))(reached ?n1 ?hbefore))
        (not 
            (and
                (not(= ?hbefore n0))
                (not(reached ?n1 ?hbefore))
            )
        )
        ;(reached_place ?bpos ?n1 ?hbefore ?hbefore)
    )
        ; true if any of the neighbors of bpos has height hbefor                
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        (has_color ?bpos blue)
        (increase (total_cost) (+
        (block_cost ?bpos)
        (path_cost ?n1)
        ))
        
    )
)

(:action remove-blue-block
    :parameters (?bpos - position ?n1 - position ?hbefore - numb ?hafter - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hbefore ?hafter)
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hafter))
        (exists(?c - color)(and(has_color ?bpos ?c)(not(= ?c red))(not(= ?c white))))
        ;(and (not(= ?hafter n0))(reached ?n1 ?hafter))
        (not 
            (and
                (not(= ?hafter n0))
                (not(reached ?n1 ?hafter))
            )
        )
        ;(reached_place ?bpos ?n1 ?hafter ?hafter))
    )
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        (increase (total_cost) (+
            (block_cost ?bpos)
            (path_cost ?n1)
        ))
    )
)
)