# write a function that gives the causal links to every action in the plan by creating a temporal dependency graph
function causal_links(plan::Vector{Term}, domain::Domain)
    causal_links = Dict{Term, Vector{Term}}()
    init_state = PDDL.initstate(domain, problem)
    for action in sol.plan
        preconditions = PDDL.get_precond(domain, action)
        print(preconditions, "\n\n\n\n")

    end
    #     causal_links[action] = []
    #     preconditions = PDDL.get_precond({action})
    #     #print preconditions
    #     print(preconditions)
    #     for precond in preconditions
    #         for (action2, preconds) in causal_links
    #             if precond in preconds
    #                 push!(causal_links[action], action2)
    #             end
    #         end
    #     end
    # end
    # return causal_links
    
end