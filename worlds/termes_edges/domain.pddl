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
    (path ?h1 - numb ?p2 - position ?h - numb)
)

(:functions
   (block_cost ?p - position)
   (path_cost ?p - position)
   (total-cost)
   )

(:derived (path ?h1 ?p2 ?h)
    (and (height ?p2 ?h1) ;sanity check, neighbor at neightbor height 
        (or
            (not (exists (?h2 - numb)(SUCC ?h1 ?h2))) ; h1 = 0, no predecessors exist
            (and 
                (exists (?h2 - numb)(SUCC ?h1 ?h2))
                (exists (?p3 - position)
                            (and
                                (NEIGHBOR ?p2 ?p3) ; neighbor of neighbor 
                                (exists (?h2 - numb)
                                    (and 
                                        (height ?p3 ?h2) ; h2 is height of neighbor of neighbor
                                        (or 
                                            (SUCC ?h1 ?h2) ; h2 = h1 - 1
                                            ;(height ?p2 ?h2) ; h2 = h1
                                            (SUCC ?h ?h2)
                                        )
                                        (path ?h2 ?p3 ?h1)
                                    )
                                )
                            )
                )
            )
        )
    )
)


(:action place-block
    :parameters (?bpos - position ?n1 - position ?hafter - numb ?hbefore - numb)
    :precondition
    (and
        (height ?bpos ?hbefore)
        (SUCC ?hafter ?hbefore)
        (and (NEIGHBOR ?bpos ?n1) (height ?n1 ?hbefore))
        (path ?hbefore ?n1 ?hafter)
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
        (path ?hafter ?n1 ?hbefore)
    )
    :effect
    (and
        (not (height ?bpos ?hbefore))
        (height ?bpos ?hafter)
        ;increase cost by 1- block_cost ?bpos
        (increase (total-cost) 
            (+
            (block_cost ?bpos)
            (path_cost ?n1)
            )
        )
    )
)
)


; (exists (?h2 - numb)
            ;     (and 
            ;         (SUCC ?h1 ?h2) 
            ;         (exists (?p3 - position)
            ;             (and
            ;                 (NEIGHBOR ?p2 ?p3)
            ;                 (or 
            ;                     (and 
            ;                         (height ?p3 ?h2)
            ;                         (path ?h2 ?p3)
            ;                     )
            ;                     (and 
            ;                         (height ?p3 ?h1)
            ;                         (path ?h1 ?p3)    
            ;                     )
            ;                 )
                            
                            
            ;             )
            ;         )
            ;     )
            
            ; )