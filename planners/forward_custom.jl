function forward_bfs(domain::Domain, problem::Problem)
    # Initialize state and extract goal
    start_state = initstate(domain, problem)
    goal = PDDL.get_goal(problem)
    # Initialize state and extract goal
    metric = PDDL.get_metric(problem)
    fluent1 = PDDL.get_fluent(domain, :block_cost)
    fluent2 = PDDL.get_fluent(domain, :path_cost)

    # Initialize search queue
    plan = []
    g_value = [(start_state, 0)]
    open = [start_state]
    closed = []
    while length(open)>0
        # Pop state and plan
        state = popfirst!(open)
        # Check if goal is satisfied
        println("here")
        if satisfy(domain, state, goal)
            # Return plan if goal is satisfied
            return plan
            #print plan
            println("Goal is satisfied\n", plan)
        end
        # Iterate over available actions and add successors to queue in order of increasing g-value
        #evaluate domain, state, metric
        for action in available(domain, state)
            next_state = transition(domain, state, action)
            next_plan = [plan; action]
            push!(open, next_state)
            #push!(g_value, (next_state, g_value[state] + evaluate(domain, state, metric)))
            push!(g_value, (next_state, evaluate(domain, state, fluent1) + evaluate(domain, state, fluent2)))
        end
        push!(closed, state)
    end


end