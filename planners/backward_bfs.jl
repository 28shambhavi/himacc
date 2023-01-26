function backward_bfs(domain::Domain, problem::Problem)
    # Construct initial state and goal state
    init_state = initstate(domain, problem)
    state = goalstate(domain, problem)
    # Initialize search queue
    plan = []
    queue = [(state, plan)]
    while length(queue) > 0
        # Pop state and plan
        state, plan = popfirst!(queue)
        # Return plan if initial state implies the current abstract state
        if all(evaluate(domain, init_state, fluent) == val
               for (fluent, val) in PDDL.get_fluents(state))
            return plan
        end
        # Iterate over relevant actions and add pre-image to queue
        for action in relevant(domain, state)
            next_state = regress(domain, state, action)
            next_plan = [action; plan]
            push!(queue, (next_state, next_plan))
        end
    end
    # Return nothing upon failure
    return nothing
end