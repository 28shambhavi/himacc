using PDDL

function forward_bfs()
    rightnow = Dates.Time(Dates.now())
    # Initialize state and extract goal
    domain = PDDL.load_domain("/home/biorobotics/julia-1.6.7-linux-x86_64/julia-1.6.7/bin/macc_pddl/pddl_test/domain_blocksworld.pddl")
    problem = PDDL.load_problem("/home/biorobotics/julia-1.6.7-linux-x86_64/julia-1.6.7/bin/macc_pddl/pddl_test/p01.pddl")
    
    state = initstate(domain, problem)
    goal = PDDL.get_goal(problem)
   
    # Initialize search queue
    plan = []
    queue = [(state, plan)]
    println(queue)
    i = 0
    while length(queue) > 0
        # Pop state and plan
        i +=1
        state, plan = popfirst!(queue)
        println(i, "th iteration", state, "state", plan, "plan")
        # Check if goal is satisfied
        if satisfy(domain, state, goal)
            # Return plan if goal is satisfied
            print("time elapsed", Dates.Time(Dates.now())-rightnow)
            return plan
        end
        # Iterate over available actions and add successors to queue
        for action in available(domain, state)
            next_state = transition(domain, state, action)
            println(next_state, "next state")
            next_plan = [plan; action]
            println(next_plan, "next plan")
            push!(queue, (next_state, next_plan))
        end
    end
    # Return nothing upon failure
    print("nothing")
    return nothing
end