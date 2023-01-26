# conflict based search
import sys
import os
import time
import math
import numpy as np
import glob
import pdb

def read_file(filename):
    print('File: %s' % filename)
    start_pos = []
    goal_pos = []
    with open(filename, 'r') as f:
        lines = f.readlines()
    for idx, l in enumerate(lines):
        a = l.split("Term[")
        actions = a[1].split("), ")
        for i in range(len(actions)):
            if actions[i].startswith("create") or actions[i].startswith("remove"):
                start_pos.append(actions[i].split("(")[1])
            elif actions[i].startswith("place") or actions[i].startswith("destroy"):
                goal_pos.append(actions[i].split("(")[1])
    return start_pos, goal_pos

def conflict_based_search(start_pos, goal_pos):
    world = np.zeros((7,4,4))
    print(world)
    for i in range(len(start_pos)):
        print("start: ", start_pos[i], "\tgoal: ", goal_pos[i])


def main():
    # if len(sys.argv) < 2:
    #     print('Usage: python cbs.py <filename>')
    #     sys.exit(1)
    # filename = sys.argv[1]
    # if not os.path.exists(filename):
    #     print('File not found: %s' % filename)
    #     sys.exit(1)
    for filename in glob.glob('/home/biorobotics/output*_abs.txt'):
        start_pos, goal_pos = read_file(filename)
        # start_time = time.time()
        conflict_based_search(start_pos, goal_pos)
        pdb.set_trace()
        # end_time = time.time()
        # print('Time: %f' % (end_time - start_time), "seconds\n\n\n")

if __name__ == '__main__':
    main()