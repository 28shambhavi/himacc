import numpy as np
import pdb 
import random


def plan(goal):
    for i in range(len(goal)):
        if goal[i][3] == 'p':
            print('P', goal[i][0], goal[i][1], goal[i][2])
        elif goal[i][3] == 'r':
            print('R', goal[i][0], goal[i][1], goal[i][2])

def main():
    goal = 0
    plan(goal)
    pass

if __name__ == '__main__':
    main()