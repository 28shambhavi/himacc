function forward_bfs()
    # Initialize state and extract goal
    # state = initstate(domain, problem)
    # goal = PDDL.get_goal(problem)
    # metric = PDDL.get_metric(problem)    
    # fluent = PDDL.get_fluent(domain, :total_cost)
    
    # spec = MinMetricGoal(goal, metric)
    # planner = AStarPlanner(MetricHeuristic(metric, [fluent], [1.0]))

    # spec = MinStepsGoal(PDDL.get_goal(problem))
    # planner = AStarPlanner(HAdd())
    # currently working version - forward search with precomputed additive heuristic
    using PDDL, SymbolicPlanners
    domain = load_domain("/home/biorobotics/himacc/worlds/termes_informative/domain_termes.pddl")
    # normalised cost function for both actions
    planner = AStarPlanner(HAdd())
    problem = load_problem("/home/biorobotics/himacc/worlds/termes_informative/p04.pddl")
       @time begin
           sol = planner(domain, problem)
           open("/home/biorobotics/himacc/worlds/outputs_old/costfn_04.txt","w") do io
               write(io, string(sol))
           end;
       end
end