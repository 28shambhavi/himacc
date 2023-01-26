function forward_bfs(domain::Domain, problem::Problem)
    # Initialize state and extract goal
    state = initstate(domain, problem)
    goal = PDDL.get_goal(problem)
    metric = PDDL.get_metric(problem)    
    fluent = PDDL.get_fluent(domain, :total_cost)
    
    spec = MinMetricGoal(goal, metric)
    planner = AStarPlanner(MetricHeuristic(metric, [fluent], [1.0]))

    spec = MinStepsGoal(PDDL.get_goal(problem))
    planner = AStarPlanner(HAdd())
end