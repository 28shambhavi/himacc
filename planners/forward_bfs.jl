function forward_bfs(domain::Domain, problem::Problem)
    # Initialize state and extract goal
    state = initstate(domain, problem)
    goal = PDDL.get_goal(problem)
    # Initialize search queue
    plan = []
    queue = [(state, plan)]
    while length(queue) > 0
        # Pop state and plan
        state, plan = popfirst!(queue)
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
    return nothing
end