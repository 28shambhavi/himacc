import sys
import os
import numpy as np
import glob
import pdb

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
    for i in range(int(x-z), int(x+z+1)):
        for j in range(int(y-z), int(y+z+1)):
            if i>=0 and i<len(block_cost) and j>=0 and j<len(block_cost[0]):
                block_cost[i][j] += (abs(x-i)+abs(y-j))/z
    return block_cost

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
    block_cost = block_cost/max_b
    print(grid, "\n")
    print(block_cost, "\n")
    return block_cost

def main():
    for filename in glob.glob("/home/biorobotics/himacc/worlds/termes_informative/p18.pddl"):
        goal = read_file(filename)
        h = calculate_heuristic(goal)

if __name__ == '__main__':
    main()



# import numpy as np
# import pdb
# #import structlibrary as

# class Graph_node():
#     global s, struct, target, size_ws
#     def __init__(self, root_, weight_b_, pos_):
#         self.root= root_
#         self.pos = pos_
#         self.weight_b = weight_b_
#         self.struct = struct[pos_[0]][pos_[1]]
#         #if self.struct>0: print(self.struct, "is the non zero weight of node at", self.pos)
#         self.child = []
#         self.parent =[]



# def weight_b_calc(x,y,z):
#     global weight_b, size_ws, struct, nodes
#     #first parent
#     for i in range(x-z, x+z+1):
#         for j in range(y-z, y+z+1):
#             if i<=size_ws-1 and j<=size_ws-1 and i>=0 and j>=0:
#                 for k in range(int(struct[i][j])): #and +1 if you want to include scaffolding 
#                     # backwards and stop if you see already assigned
#                     # if (x!=i or y!=j) and k<=z-abs(x-i)-abs(y-j):
#                     if k<=z-abs(x-i)-abs(y-j) and not(i==x and j==y and k==z):
#                         if weight_b[i][j][k]==0:  #root nodes also append
#                             weight_b[i][j][k]=abs(z-k -abs(x-i)-abs(y-j))+1
#                             a = [n for n in nodes if n[1]==(i,j,k)]
#                             b = [n for n in nodes if n[1]==(x,y,z)]
#                             print("a: ", a)
#                             print("b: ", b)
#                             b[0][0].child.append(a[0][0])
#                             a[0][0].parent.append(b[0][0])
#     #division
#     # for i in range(x-z+1, x+z):
#     #     for j in range(y-z+1, y+z):
#     #         for k in range(struct[i][j]): #and +1 if you want to include scaffolding
#     #             if x!=i or y!=j:
#                     # if weight_b[i][j][k]==0: 
#                     #     weight_b[i][j][k]=abs(20+z-k +abs(x-i)-abs(y-j))
#                     #     a = [n for n in nodes if n[1]==(i,j,k)]
#                     #     b = [n for n in nodes if n[1]==(x,y,z)]
#                     #     b[0][0].child.append(a[0][0])
#     #                 if weight_b[i][j][k]<abs(20+z-k -abs(x-i)-abs(y-j)):
#     #                     weight_b[i][j][k]=abs(20+z-k +abs(x-i)-abs(y-j))
#     #                     a = [n for n in nodes if n[1]==(i,j,k)]
#     #                     b = [n for n in nodes if n[1]==(x,y,z)]
#     #                     b[0][0].child.append(a[0][0])

# # def main():
# #     global size_ws, struct, weight_a, weight_b, weight_c, nodes
# #     size_ws = 10
# #     print("size_ws: ", size_ws)
# #     max_height = 7
# #     weight_b = np.zeros((size_ws,size_ws, max_height))
    
# #     nodes=[]

# #     for i in range(size_ws):
# #         for j in range(size_ws):
# #             if struct[i][j]>0: #for height of 3 we need three objects of z = 0,1,2 
# #                 for k in range(struct[i][j]):
# #                     nodes.append(((Graph_node((i,j,k), weight_b[i][j][k], (i,j, k))),(i,j, k)))
    
# #     #sort the nodes according to height
# #     nodes.sort(key=lambda x: x[1][2], reverse=True)
   

# #     for a in nodes:
# #         if a[1][2]>0: weight_b_calc(a[1][0], a[1][1], a[1][2])
    

# #     #output as list
# #     for a in nodes:
# #         if len(a[0].child)>0:
# #             child_list=[]
# #             child_list.append(a[0].pos)
# #             for b in a[0].child:
# #                 child_list.append(b.pos)
# #             print(child_list)
# #         elif len(a[0].parent)==0:
# #             print([a[0].pos])

# # main()
# def get_decompositions(structures):
#     struct_decomp = []
#     print("inside basins of att")
#     for s in structures:
#         global size_ws, struct, weight_a, weight_b, weight_c, nodes
#         struct = s
#         size_ws = len(s[0])
#         print("size_ws: ", size_ws)
#         max_height = 7
#         weight_b = np.zeros((size_ws,size_ws, max_height))
        
#         nodes=[]

#         for i in range(size_ws):
#             for j in range(size_ws):
#                 print(i,j,"i and j")
#                 if struct[i][j]>0: #for height of 3 we need three objects of z = 0,1,2 
#                     for k in range(int(struct[i][j])):
#                         nodes.append(((Graph_node((i,j,k), weight_b[i][j][k], (i,j, k))),(i,j, k)))
        
#         #sort the nodes according to height
#         nodes.sort(key=lambda x: x[1][2], reverse=True)
        

#         for a in nodes:
#             if a[1][2]>0: weight_b_calc(a[1][0], a[1][1], a[1][2])
        

#         #output as list
#         d = []
#         for a in nodes:
#             if len(a[0].child)>0:
#                 child_list=[]
#                 child_list.append(a[0].pos)
#                 for b in a[0].child:
#                     child_list.append(b.pos)
#                 d.append(child_list)
#                 print(child_list)
#             elif len(a[0].parent)==0:
#                 print([a[0].pos])
#                 d.append([a[0].pos])
#         print("d\n")
#         print(d)
#         struct_decomp.append(d)
#         # pdb.set_trace()
#     return struct_decomp