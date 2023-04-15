import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np

axes = [7, 7, 7]
data = np.zeros(axes)
# get data from function and put it in data
# print(data)
# data_z0 = [[0, 0, 1, 0, 0, 0, 0], 
#            [0, 1, 1, 1, 0, 0, 0],
#            [1, 1, 0, 1, 1, 0, 0],
#            [0, 1, 1, 1, 0, 0, 0],
#            [0, 0, 1, 0, 0, 0, 0], 
#            [0, 0, 0, 0, 0, 0, 0],
#            [0, 0, 0, 0, 0, 0, 0]]
data_z0 = [[0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0]]
data_z1 = [[0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0]]
data_z2 = [[0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 1, 1, 1, 0, 0],
            [0, 0, 1, 0, 1, 0, 0],
            [0, 0, 1, 1, 1, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0]]
data_z3 = [[0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 1, 0, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0]]
data_z4 = [[0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 1, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0]]
data_z5 = [[0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 1, 1, 0, 0],
            [0, 0, 0, 0, 0, 0, 0]]
data_z6 = [[0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 1, 1, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0], 
            [0, 0, 0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0, 0, 0]]
# #vertically stack the data to create a 3D array
data = data + np.array([data_z0, data_z1, data_z2, data_z3, data_z4, data_z5, data_z6])
# print index if value of data=1 else dont print index
print(np.argwhere(data==1))
colors = np.zeros(axes + [4], dtype=np.float32)

# Control Transparency
alpha = 0.8
beta = 0.3
# #set the color of each object
# colors = np.zeros(axes + [4], dtype=np.float32)
for xi in range(0,7):
    for yi in range(0,7):
        for zi in range(0,7):
            colors[xi, yi, zi] = [0.9, 0.9, 0.1, alpha]

colors[3,3,2] = [0.1, 0.1, 0.1, alpha]
colors[3,3,4] = [0.1, 0.1, 0.1, alpha]
colors[4,3,3] = [0.1, 0.1, 0.1, alpha]
colors[5,5,3] = [0.9, 0.1, 0.1, alpha]
colors[6,1,4] = [0.9, 0.1, 0.1, alpha]
fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
ax.voxels(data, facecolors=colors, edgecolors='black')

# it can be used to change the axes view
# ax.view_init(100, 90)
#show plt
#grid off
ax.grid(False)
plt.show()