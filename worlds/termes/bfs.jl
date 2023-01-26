using PDDL
function forward_bfs()
    # Initialize state and extract goal
    domain = PDDL.load_domain("/home/biorobotics/julia-1.6.7-linux-x86_64/julia-1.6.7/bin/macc_pddl/termes/domain_termes.pddl")
    problem = PDDL.load_problem("/home/biorobotics/julia-1.6.7-linux-x86_64/julia-1.6.7/bin/macc_pddl/termes/p01.pddl")
    
    state = initstate(domain, problem)
    goal = PDDL.get_goal(problem)
    println(goal)
    # Initialize search queue
    plan = []
    queue = [(state, plan)]
    i = 0
    println("\n\n\n")
    while (length(queue) > 0) && (i<10)
        # Pop state and plan
        i+=1
        state, plan = popfirst!(queue)
        println("iteration ",i)
        println(state, "state")
        println(plan, "plan")
        println("\n\n\n")
        # Check if goal is satisfied
        if satisfy(domain, state, goal)
            # Return plan if goal is satisfied
            return plan
        end
        # Iterate over available actions and add successors to queue
        for action in available(domain, state)
            next_state = transition(domain, state, action)
            next_plan = [plan; action]
            push!(queue, (next_state, next_plan))
        end
    end
    # Return nothing upon failure
    print("nothing")
    return nothing
end