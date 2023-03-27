# A star search algorithm for a 3D grid

import sys
import math
import numpy as np
import parse_output as po

# The grid is a 3D array of integers
# 0 = free space, n = height of location

def write_to_file(action_sequence):
    with open('/home/biorobotics/himacc/worlds/outputs_old/action_seq_3_mod.txt', 'w') as f:
        for i in range(len(action_sequence)):
            f.write(str(action_sequence[i]) + '\n')

def main():
    grid = [[0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 3, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 4, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0, 0]]
    action_sequence = po.main()
    print(action_sequence)
    # The start and end locations are tuples of (x, y, z)
    start = (3, 2, 0)
    write_to_file(action_sequence)


if __name__ == '__main__':
    main()