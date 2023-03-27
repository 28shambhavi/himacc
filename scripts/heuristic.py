import sys
import os
import numpy as np
import glob
import pdb
import networkx as nx

def read_file(filename):
    print('File: %s' % filename)
    with open(filename, 'r') as f:
        lines = f.readlines()
    g = 0
    goal = []
    for idx, l in enumerate(lines):
        if l.startswith("(:goal"):
            g = 1
        if g == 1:
            if l.startswith("    (height"):
                x = l.split(" ")
                goal.append((int(x[5].split("-")[1]), int(x[5].split("-")[2]), int(x[6].split(")")[0].split("n")[1])))
    return goal

def block_cost_calc(block_cost, x, y, z):
    for i in range(int(x-z), int(x+z)):
        for j in range(int(y-z), int(y+z)):
            if i>=0 and i<len(block_cost) and j>=0 and j<len(block_cost[0]) and (abs(x-i)+abs(y-j))<=z:
                block_cost[i][j] += (z - (abs(x-i)+abs(y-j)))/z
    return block_cost

def tree_edges(block_cost, grid):
    G = nx.Graph()
    for i in range(len(block_cost)):
        for j in range(len(block_cost[0])):
            G.add_node((i,j), weight=grid[i][j])
    for i in range(len(block_cost)):
        for j in range(len(block_cost[0])):
            if i>0:
                G.add_edge((i,j), (i-1,j))
            if j>0:
                G.add_edge((i,j), (i,j-1))
            if i<len(block_cost)-1:
                G.add_edge((i,j), (i+1,j))
            if j<len(block_cost[0])-1:
                G.add_edge((i,j), (i,j+1))
    for e in G.edges():
        nmr = 1 + int(grid[e[0][0]][e[0][1]]) - int(grid[e[1][0]][e[1][1]])
        dnr = 1 + int(block_cost[e[0][0]][e[0][1]]) + int(block_cost[e[1][0]][e[1][1]])
        G.edges[e]['weight'] = nmr/dnr
        print(e, G[e[0]][e[1]]['weight'])

def calculate_heuristic(goal):
    grid = np.zeros((goal[-1][0]+1, goal[-1][1]+1))
    block_cost = np.zeros((goal[-1][0]+1, goal[-1][1]+1))
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            grid[i][j] = goal[len(grid[0])*i+j][2]
            if grid[i][j]>0:
                block_cost = block_cost_calc(block_cost, i, j, grid[i][j])
    max_b = 1
    for i in range(len(block_cost)):
        for j in range(len(block_cost[0])):
            if block_cost[i][j]>max_b:
                max_b = block_cost[i][j]
    place_cost = np.zeros((grid.shape[0], grid.shape[1]))
    for i in range(len(block_cost)):
        for j in range(len(block_cost[0])):
            block_cost[i][j] = block_cost[i][j]/max_b
            place_cost[i][j] = 1 - block_cost[i][j]
    print(grid, "\n")
    
    print(place_cost, "\n")
    path_cost = np.zeros((grid.shape[0], grid.shape[1]))
    depot = (2,0)
    for i in range(len(grid)):
        for j in range(len(grid[0])):
            path_cost[i][j] = (min(min(i+1, len(grid)-i), min(j+1, len(grid[0])-j)))/10
    print(path_cost, "\n")
    return block_cost, path_cost

def main():
    for filename in glob.glob("/home/biorobotics/himacc/worlds/termes_wpath_derived/p03.pddl"):
        goal = read_file(filename)
        hb, hp = calculate_heuristic(goal)

if __name__ == '__main__':
    main()