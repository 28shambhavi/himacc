
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
    (has_color ?p - position ?n - numb ?c - color)
    (holding_block ?c - color)
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
                        )
                        )
                    )
                )
            )
    )
)
(:derived (reached_same ?bpos ?h)
    (and 
        (exists (?n1 - position)
            (and (NEIGHBOR ?bpos ?n1)
                (exists (?h1 - numb)
                    (and 
                        (height ?n1 ?h1)
                        (or (and (= ?h n0))
                            (and (= ?h1 n0)(SUCC ?h ?h1))
                            (and (not(= ?h ?h1))(SUCC ?h ?h1)(reached ?n1 ?h1))
                        )
                        )
                    )
                )
            )
    )
)
(:action create-block
    :parameters (?c - color)
    :precondition 
    (and 
        (not(holding_block ?c))
        (not(= ?c white))
    )
    :effect 
    (and 
        (holding_block ?c)
    )
)

(:action destroy-block
    :parameters (?c - color)
    :precondition 
    (and 
        (holding_block ?c)
    )
    :effect 
    (and 
        (not(holding_block ?c))
    )
)

(:action place-block
    :parameters (?bpos - position ?n1 - position ?hafter - numb ?hbefore - numb ?c - color)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hafter ?hbefore)
        ;(or (has_color ?bpos ?hbefore ?c)(and (has_color ?bpos ?hbefore white)(= ?hbefore n0)))
        (holding_block ?c)
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hbefore))
        (not 
            (and
                (not(= ?hbefore n0))
                (not(reached ?n1 ?hbefore))
            )
        )
    )               
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (not(holding_block ?c))
        (height ?bpos ?hafter)
        (has_color ?bpos ?hafter ?c)
        (increase (total_cost) (+
        (block_cost ?bpos)
        (path_cost ?n1)
        ))
    )
)

(:action remove-block
    :parameters (?bpos - position ?n1 - position ?hbefore - numb ?hafter - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hbefore ?hafter)
        (exists (?c1 - color)(not(holding_block ?c1)))
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hafter))
        (not 
            (and
                (not(= ?hafter n0))
                (not(reached ?n1 ?hafter))
            )
        )
        
    )
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (when
        (and (= ?hafter n0));Antecedent
        (and (has_color ?bpos ?hafter white));Consequence 
        )
        (has_color ?bpos ?hbefore white)
        (height ?bpos ?hafter)
        (increase (total_cost) (+
            (block_cost ?bpos)
            (path_cost ?n1)
        ))
    )
)
)