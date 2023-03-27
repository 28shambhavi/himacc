
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
   (total_cost)
   )

(:derived (path ?bpos ?n1 ?h_high ?h_low)
    (and 
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?h_low) (height ?bpos ?h_high)) ; always true , height of neighbour(in path to bpos) = {h of bpos, h of bpos - 1}, thus, h(bpos) = h_high, h(n1) = h_low
        (or 
            (not (exists (?h - numb) (SUCC ?h_low ?h))) ; check if h_low is n0
            (exists (?h - numb) 
                (or 
                    (and (SUCC ?h_low ?h)(height ?n1 ?h_low)(height ?n1 ?h_high); if not, check if h_low = h_high
                        (exists (?n2 - position)
                            (and (NEIGHBOR ?n1 ?n2)(height ?n2 ?h_high)(height ?n2 ?h_low)))
                    )
                    (and (not (and (height ?n1 ?h_low)(height ?n1 ?h_high))); if not, check if h_low = h_high - 1 
                        (SUCC ?h_low ?h)
                        (exists (?n2 - position)
                            (and (NEIGHBOR ?n1 ?n2)(height ?n2 ?h)(height ?n1 ?h_low))
                        )
                    )
                )
            )
        )
    )
    (and (NEIGHBOR ?bpos ?n1))
)




(:action place-block
    :parameters (?bpos - position ?n1 - position ?hafter - numb ?hbefore - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hafter ?hbefore)
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hbefore))        
    )
        ; true if any of the neighbors of bpos has height hbefor                
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
        (increase (total_cost) (+
            (block_cost ?bpos)
            (path_cost ?n1)
        ))
    )
)
)