
(define (domain blocksworld)
  (:requirements :strips :typing :equality :negative-preconditions :universal-preconditions :disjunctive-preconditions :fluents :derived-predicates :conditional-effects :action-costs)

(:types
    ;numb - object ;number of blocks, represents height
    position - object ;position of a block
)

(:predicates
    (path-search ?bpos ?pathpos)   
    (path-search-same ?bpos ?pathpos) 
)

(:functions
   (block_cost ?p - position)
   (path_cost ?p - position)
   (row ?p - position)
   (col ?p - position)
   (height ?p - position)
   (total_cost)
   )


(:derived (path-search ?bpos ?pathpos)
       ; bpos is position to find the path, pathpos is last pos in path so far    
        ; exists a neighbour with same height or height-1
    (and
        (exists (?newpos - position)
            (and 
                (not (= ?newpos ?pathpos))
                ; (not (= ?newpos ?bpos))
                ;(or (= (height ?bpos) (height ?newpos))(= (height ?bpos) (+(height ?newpos)1)))
                (= (height ?bpos) (+(height ?newpos)1))
                (or 
                    (and (= ( - (row ?bpos) (row ?newpos)) -1)(= (col ?bpos) (col ?newpos)))
                    (and (= ( - (col ?bpos) (col ?newpos)) -1)(= (row ?bpos) (row ?newpos)))
                    (and (= ( - (row ?bpos) (row ?newpos)) 1)(= (col ?bpos) (col ?newpos)))
                    (and (= ( - (col ?bpos) (col ?newpos)) 1)(= (row ?bpos) (row ?newpos)))
                )
                (or (= (height ?newpos) 0)(path-search-same ?newpos ?bpos))
                )
        )

    )

)

(:derived (path-search-same ?bpos ?pathpos)
       ; bpos is position to find the path, pathpos is last pos in path so far    
        ; exists a neighbour with same height or height-1
    (and
        (exists (?newpos - position)
            (and 
                (not (= ?newpos ?pathpos))
                ; (not (= ?newpos ?bpos))
                (or (= (height ?bpos) (height ?newpos))(= (height ?bpos) (+(height ?newpos)1)))
                ;(= (height ?bpos) (+(height ?newpos)1))
                (or 
                    (and (= ( - (row ?bpos) (row ?newpos)) -1)(= (col ?bpos) (col ?newpos)))
                    (and (= ( - (col ?bpos) (col ?newpos)) -1)(= (row ?bpos) (row ?newpos)))
                    (and (= ( - (row ?bpos) (row ?newpos)) 1)(= (col ?bpos) (col ?newpos)))
                    (and (= ( - (col ?bpos) (col ?newpos)) 1)(= (row ?bpos) (row ?newpos)))
                )
                (or (= (height ?newpos) 0)(path-search ?newpos ?bpos))
                )
        )

    )

)

(:action place-block
    :parameters (?bpos - position)
    :precondition (and
        ; exists a neighbour with same height
        (exists (?n1 - position)
            (and
                (= (height ?bpos) (height ?n1))
                (or 
                    (and (= ( - (row ?bpos) (row ?n1)) -1)(= (col ?bpos) (col ?n1)))
                    (and (= ( - (col ?bpos) (col ?n1)) -1)(= (row ?bpos) (row ?n1)))
                    (and (= ( - (row ?bpos) (row ?n1)) 1)(= (col ?bpos) (col ?n1)))
                    (and (= ( - (col ?bpos) (col ?n1)) 1)(= (row ?bpos) (row ?n1)))
                )
                (or (= (height ?n1) 0)(path-search ?n1 ?bpos))
            )
        )
    )
    :effect
    (and
        ; increase height of bpos by 1
        (increase (height ?bpos) 1)
        (increase (total_cost)(block_cost ?bpos))
        
    )
)

(:action remove-block
    :parameters (?bpos - position)
    :precondition (and
        ; exists a neighbour with same height
        (exists (?n1 - position)
            (and
                (= (+(height ?n1)1)(height ?bpos))
                (or 
                    (and (= ( - (row ?bpos) (row ?n1)) -1)(= (col ?bpos) (col ?n1)))
                    (and (= ( - (col ?bpos) (col ?n1)) -1)(= (row ?bpos) (row ?n1)))
                    (and (= ( - (row ?bpos) (row ?n1)) 1)(= (col ?bpos) (col ?n1)))
                    (and (= ( - (col ?bpos) (col ?n1)) 1)(= (row ?bpos) (row ?n1)))
                )
                (or (= (height ?n1) 0)(path-search ?n1 ?bpos))
            )
        )
    )
    :effect
    (and
        (decrease (height ?bpos) 1)
        (increase (total_cost)(block_cost ?bpos))
    )
)
)