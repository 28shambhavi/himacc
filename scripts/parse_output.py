import numpy as np
import glob
import pdb
import planner_firsttry as planner

def read_file(filename):
    print('File: %s' % filename)
    #start_pos = []
    goal_pos = []
    with open(filename, 'r') as f:
        lines = f.readlines()
    for idx, l in enumerate(lines):
        a = l.split("Term[")
        actions = a[1].split("), ")
        for i in range(len(actions)):
            if actions[i].startswith("place") or actions[i].startswith("remove"):
                act_array = actions[i].split("(")[1].split(", ")
                goal_pos.append((act_array[0],act_array[1], act_array[2].split('n')[1], act_array[3].split('n')[1], actions[i][0]))
    return goal_pos

def gen_action_seq(goal_pos):
    action_sequence = []
    depot = (0,1,0)
    goal = []
    for i in range(len(goal_pos)):
        if goal_pos[i][4] == 'p':
            goal.append((int(goal_pos[i][1].split("-")[1]), int(goal_pos[i][1].split("-")[2]), int(goal_pos[i][2]), 'p'))
        elif goal_pos[i][4] == 'r':
            goal.append((int(goal_pos[i][1].split("-")[1]), int(goal_pos[i][1].split("-")[2]), int(goal_pos[i][3]), 'r'))
        
    planner_sequence = planner.plan(goal)
    
    # store action sequence in file in seperate lines
    for i in range(len(goal_pos)):
        if goal_pos[i][4] == 'p':
            #goal.append((int(goal_pos[i][1].split("-")[1]), int(goal_pos[i][1].split("-")[2]), int(goal_pos[i][2])))
            # action_sequence.append((len(action_sequence), 0, 'M', depot[0]+1, depot[1], depot[2]))
            # action_sequence.append((len(action_sequence), 0, 'P', depot[0], depot[1], depot[2]))
            # action_sequence.append((len(action_sequence), 1, 'M', int(goal_pos[i][1].split("-")[1]), int(goal_pos[i][1].split("-")[2]), int(goal_pos[i][2])))
            # action_sequence.append((len(action_sequence), 1, 'D', int(goal_pos[i][0].split("-")[1]), int(goal_pos[i][0].split("-")[2]), int(goal_pos[i][3])))
            #action_sequence.append((len(action_sequence), depot[0]+1, depot[1], depot[2], 0, 'P', depot[0], depot[1], depot[2]))
            action_sequence.append((len(action_sequence), int(goal_pos[i][1].split("-")[1]), int(goal_pos[i][1].split("-")[2]), int(goal_pos[i][2]), 1, 'D', int(goal_pos[i][0].split("-")[1]), int(goal_pos[i][0].split("-")[2]), int(goal_pos[i][3])-1))      
        elif goal_pos[i][4] == 'r':
            # action_sequence.append((len(action_sequence), 0, 'M', int(goal_pos[i][1].split("-")[1]), int(goal_pos[i][1].split("-")[2]), int(goal_pos[i][3])))
            # action_sequence.append((len(action_sequence), 0, 'P', int(goal_pos[i][0].split("-")[1]), int(goal_pos[i][0].split("-")[2]), int(goal_pos[i][2])))         
            # action_sequence.append((len(action_sequence), 1, 'M', depot[0]+1, depot[1], depot[2]))
            # action_sequence.append((len(action_sequence), 1, 'D', depot[0], depot[1], depot[2]))
            action_sequence.append((len(action_sequence), int(goal_pos[i][1].split("-")[1]), int(goal_pos[i][1].split("-")[2]), int(goal_pos[i][3]), 0, 'P', int(goal_pos[i][0].split("-")[1]), int(goal_pos[i][0].split("-")[2]), int(goal_pos[i][2])-1))         
            #action_sequence.append((len(action_sequence), 1, depot[0]+1, depot[1], depot[2], 'D', depot[0], depot[1], depot[2]))
    # store action sequence in file in seperate lines
    return action_sequence
    

def main():
    for filename in glob.glob('/home/biorobotics//himacc/worlds/outputs_old/pathandblockcost_22*.txt'):
        goal_pos = read_file(filename)
        action_sequence = gen_action_seq(goal_pos)
        print(action_sequence)

if __name__ == '__main__':
    main()