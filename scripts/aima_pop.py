from planner import *

class PartialOrderPlanner:

    def __init__(self, planningproblem):
        self.planningproblem = planningproblem
        self.initialize()

    def initialize(self):
        """Initialize all variables"""
        self.causal_links = []
        self.start = Action('Start', [], self.planningproblem.init)
        self.finish = Action('Finish', self.planningproblem.goals, [])
        self.actions = set()
        self.actions.add(self.start)
        self.actions.add(self.finish)
        self.constraints = set()
        self.constraints.add((self.start, self.finish))
        self.agenda = set()
        for precond in self.finish.precond:
            self.agenda.add((precond, self.finish))
        self.expanded_actions = self.expand_actions()

    def expand_actions(self, name=None):
        """Generate all possible actions with variable bindings for precondition selection heuristic"""

        objects = set(arg for clause in self.planningproblem.init for arg in clause.args)
        expansions = []
        action_list = []
        if name is not None:
            for action in self.planningproblem.actions:
                if str(action.name) == name:
                    action_list.append(action)
        else:
            action_list = self.planningproblem.actions

        for action in action_list:
            for permutation in itertools.permutations(objects, len(action.args)):
                bindings = unify(Expr(action.name, *action.args), Expr(action.name, *permutation))
                if bindings is not None:
                    new_args = []
                    for arg in action.args:
                        if arg in bindings:
                            new_args.append(bindings[arg])
                        else:
                            new_args.append(arg)
                    new_expr = Expr(str(action.name), *new_args)
                    new_preconds = []
                    for precond in action.precond:
                        new_precond_args = []
                        for arg in precond.args:
                            if arg in bindings:
                                new_precond_args.append(bindings[arg])
                            else:
                                new_precond_args.append(arg)
                        new_precond = Expr(str(precond.op), *new_precond_args)
                        new_preconds.append(new_precond)
                    new_effects = []
                    for effect in action.effect:
                        new_effect_args = []
                        for arg in effect.args:
                            if arg in bindings:
                                new_effect_args.append(bindings[arg])
                            else:
                                new_effect_args.append(arg)
                        new_effect = Expr(str(effect.op), *new_effect_args)
                        new_effects.append(new_effect)
                    expansions.append(Action(new_expr, new_preconds, new_effects))

        return expansions

    def find_open_precondition(self):
        """Find open precondition with the least number of possible actions"""

        number_of_ways = dict()
        actions_for_precondition = dict()
        for element in self.agenda:
            open_precondition = element[0]
            possible_actions = list(self.actions) + self.expanded_actions
            for action in possible_actions:
                for effect in action.effect:
                    if effect == open_precondition:
                        if open_precondition in number_of_ways:
                            number_of_ways[open_precondition] += 1
                            actions_for_precondition[open_precondition].append(action)
                        else:
                            number_of_ways[open_precondition] = 1
                            actions_for_precondition[open_precondition] = [action]

        number = sorted(number_of_ways, key=number_of_ways.__getitem__)
        
        for k, v in number_of_ways.items():
            if v == 0:
                return None, None, None

        act1 = None
        for element in self.agenda:
            if element[0] == number[0]:
                act1 = element[1]
                break

        if number[0] in self.expanded_actions:
            self.expanded_actions.remove(number[0])

        return number[0], act1, actions_for_precondition[number[0]]

    def find_action_for_precondition(self, oprec):
        """Find action for a given precondition"""

        # either
        #   choose act0 E Actions such that act0 achieves G
        for action in self.actions:
            for effect in action.effect:
                if effect == oprec:
                    return action, 0

        # or
        #   choose act0 E Actions such that act0 achieves G
        for action in self.planningproblem.actions:
            for effect in action.effect:
                if effect.op == oprec.op:
                    bindings = unify(effect, oprec)
                    if bindings is None:
                        break
                    return action, bindings

    def generate_expr(self, clause, bindings):
        """Generate atomic expression from generic expression given variable bindings"""

        new_args = []
        for arg in clause.args:
            if arg in bindings:
                new_args.append(bindings[arg])
            else:
                new_args.append(arg)

        try:
            return Expr(str(clause.name), *new_args)
        except:
            return Expr(str(clause.op), *new_args)
        
    def generate_action_object(self, action, bindings):
        """Generate action object given a generic action andvariable bindings"""

        # if bindings is 0, it means the action already exists in self.actions
        if bindings == 0:
            return action

        # bindings cannot be None
        else:
            new_expr = self.generate_expr(action, bindings)
            new_preconds = []
            for precond in action.precond:
                new_precond = self.generate_expr(precond, bindings)
                new_preconds.append(new_precond)
            new_effects = []
            for effect in action.effect:
                new_effect = self.generate_expr(effect, bindings)
                new_effects.append(new_effect)
            return Action(new_expr, new_preconds, new_effects)

    def cyclic(self, graph):
        """Check cyclicity of a directed graph"""

        new_graph = dict()
        for element in graph:
            if element[0] in new_graph:
                new_graph[element[0]].append(element[1])
            else:
                new_graph[element[0]] = [element[1]]

        path = set()

        def visit(vertex):
            path.add(vertex)
            for neighbor in new_graph.get(vertex, ()):
                if neighbor in path or visit(neighbor):
                    return True
            path.remove(vertex)
            return False

        value = any(visit(v) for v in new_graph)
        return value

    def add_const(self, constraint, constraints):
        """Add the constraint to constraints if the resulting graph is acyclic"""

        if constraint[0] == self.finish or constraint[1] == self.start:
            return constraints

        new_constraints = set(constraints)
        new_constraints.add(constraint)

        if self.cyclic(new_constraints):
            return constraints
        return new_constraints

    def is_a_threat(self, precondition, effect):
        """Check if effect is a threat to precondition"""

        if (str(effect.op) == 'Not' + str(precondition.op)) or ('Not' + str(effect.op) == str(precondition.op)):
            if effect.args == precondition.args:
                return True
        return False

    def protect(self, causal_link, action, constraints):
        """Check and resolve threats by promotion or demotion"""

        threat = False
        for effect in action.effect:
            if self.is_a_threat(causal_link[1], effect):
                threat = True
                break

        if action != causal_link[0] and action != causal_link[2] and threat:
            # try promotion
            new_constraints = set(constraints)
            new_constraints.add((action, causal_link[0]))
            if not self.cyclic(new_constraints):
                constraints = self.add_const((action, causal_link[0]), constraints)
            else:
                # try demotion
                new_constraints = set(constraints)
                new_constraints.add((causal_link[2], action))
                if not self.cyclic(new_constraints):
                    constraints = self.add_const((causal_link[2], action), constraints)
                else:
                    # both promotion and demotion fail
                    print('Unable to resolve a threat caused by', action, 'onto', causal_link)
                    return
        return constraints

    def convert(self, constraints):
        """Convert constraints into a dict of Action to set orderings"""

        graph = dict()
        for constraint in constraints:
            if constraint[0] in graph:
                graph[constraint[0]].add(constraint[1])
            else:
                graph[constraint[0]] = set()
                graph[constraint[0]].add(constraint[1])
        return graph

    def toposort(self, graph):
        """Generate topological ordering of constraints"""

        if len(graph) == 0:
            return

        graph = graph.copy()

        for k, v in graph.items():
            v.discard(k)

        extra_elements_in_dependencies = _reduce(set.union, graph.values()) - set(graph.keys())

        graph.update({element:set() for element in extra_elements_in_dependencies})
        while True:
            ordered = set(element for element, dependency in graph.items() if len(dependency) == 0)
            if not ordered:
                break
            yield ordered
            graph = {element: (dependency - ordered) for element, dependency in graph.items() if element not in ordered}
        if len(graph) != 0:
            raise ValueError('The graph is not acyclic and cannot be linearly ordered')

    def display_plan(self):
        """Display causal links, constraints and the plan"""

        print('Causal Links')
        for causal_link in self.causal_links:
            print(causal_link)

        print('\nConstraints')
        for constraint in self.constraints:
            print(constraint[0], '<', constraint[1])

        print('\nPartial Order Plan')
        print(list(reversed(list(self.toposort(self.convert(self.constraints))))))

    def execute(self, display=True):
        """Execute the algorithm"""

        step = 1
        self.tries = 1
        while len(self.agenda) > 0:
            step += 1
            # select <G, act1> from Agenda
            try:
                G, act1, possible_actions = self.find_open_precondition()
            except IndexError:
                print('Probably Wrong')
                break

            act0 = possible_actions[0]
            # remove <G, act1> from Agenda
            self.agenda.remove((G, act1))

            # For actions with variable number of arguments, use least commitment principle
            # act0_temp, bindings = self.find_action_for_precondition(G)
            # act0 = self.generate_action_object(act0_temp, bindings)

            # Actions = Actions U {act0}
            self.actions.add(act0)

            # Constraints = add_const(start < act0, Constraints)
            self.constraints = self.add_const((self.start, act0), self.constraints)

            # for each CL E CausalLinks do
            #   Constraints = protect(CL, act0, Constraints)
            for causal_link in self.causal_links:
                self.constraints = self.protect(causal_link, act0, self.constraints)

            # Agenda = Agenda U {<P, act0>: P is a precondition of act0}
            for precondition in act0.precond:
                self.agenda.add((precondition, act0))

            # Constraints = add_const(act0 < act1, Constraints)
            self.constraints = self.add_const((act0, act1), self.constraints)

            # CausalLinks U {<act0, G, act1>}
            if (act0, G, act1) not in self.causal_links:
                self.causal_links.append((act0, G, act1))

            # for each A E Actions do
            #   Constraints = protect(<act0, G, act1>, A, Constraints)
            for action in self.actions:
                self.constraints = self.protect((act0, G, act1), action, self.constraints)

            if step > 200:
                print('Couldn\'t find a solution')
                return None, None

        if display:
            self.display_plan()
        else:
            return self.constraints, self.causal_links                
