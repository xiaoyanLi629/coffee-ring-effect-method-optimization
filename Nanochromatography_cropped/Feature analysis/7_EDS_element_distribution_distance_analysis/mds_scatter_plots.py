import matplotlib.pyplot as plt
import os
from numpy import genfromtxt
import scipy.io

mat = scipy.io.loadmat('coordinates_cond/Ca_Mg_Na_js_mds_coordinates_cond.mat')

total_MDS_coordinates = mat['js_mds_coordinates_cell']

# MDS coordinates
try: 
    os.mkdir('MDS_scatter_image')
except OSError as error: 
    print(error)

font = {'family': 'serif',
        'color':  'black',
        'weight': 'bold',
        'size': 14,
        }

for i in range(9):
	MDS_coordinates = total_MDS_coordinates[i][0]
	x = MDS_coordinates[:, 0]
	y = MDS_coordinates[:, 1]
	z = MDS_coordinates[:, 2]

	fig = plt.figure(figsize = (10, 7))
	ax = plt.axes(projection ="3d")
	
	my_cmap = plt.get_cmap('plasma')

	# Creating plot
	# print(MDS_coordinates[1:, 0])
	ax.scatter3D(x[0:25], y[0:25], z[0:25], c = 'red', alpha = 0.8, s = 50)
	ax.scatter3D(x[25:50], y[25:50], z[25:50], c = 'green', alpha = 0.8, s = 50)
	ax.scatter3D(x[50:75], y[50:75], z[50:75], c = 'blue', alpha = 0.8, s = 50)

	plt.title("Images MDS 3D coordiamntes under condition " + chr(i+65))

	ax.set_xlabel('Component 1', fontdict=font)
	ax.set_ylabel('Component 2', fontdict=font)
	ax.set_zlabel('Component 3', fontdict=font)

	# ax.set_xlabel(fontdict=font)

	# ax.set_xticks([0, 4, 9, 14, 19, 24])
	plt.legend(["Element Ca", "Element Mg", "Element Na"], 
	bbox_to_anchor=(1.3, 1), loc ="upper right")

	# plt.show()
	filename = 'MDS_scatter_image/' + chr(i+65) + '_js_Ca_Mg_Na_coords.png'
	plt.savefig(filename, bbox_inches='tight', dpi = 600)




# MDS coordinates
mat = scipy.io.loadmat('coordinates_cond/C_Cl_S_js_mds_coordinates_cond.mat')

total_MDS_coordinates = mat['js_mds_coordinates_cell']

font = {'family': 'serif',
        'color':  'black',
        'weight': 'bold',
        'size': 14,
        }

for i in range(9):
	MDS_coordinates = total_MDS_coordinates[i][0]
	x = MDS_coordinates[:, 0]
	y = MDS_coordinates[:, 1]
	z = MDS_coordinates[:, 2]

	fig = plt.figure(figsize = (10, 7))
	ax = plt.axes(projection ="3d")
	
	my_cmap = plt.get_cmap('plasma')

	# Creating plot
	# print(MDS_coordinates[1:, 0])
	ax.scatter3D(x[0:25], y[0:25], z[0:25], c = 'red', alpha = 0.8, s = 50)
	ax.scatter3D(x[25:50], y[25:50], z[25:50], c = 'green', alpha = 0.8, s = 50)
	ax.scatter3D(x[50:75], y[50:75], z[50:75], c = 'blue', alpha = 0.8, s = 50)

	plt.title("Images MDS 3D coordiamntes under condition " + chr(i+65))

	ax.set_xlabel('Component 1', fontdict=font)
	ax.set_ylabel('Component 2', fontdict=font)
	ax.set_zlabel('Component 3', fontdict=font)

	# ax.set_xlabel(fontdict=font)

	# ax.set_xticks([0, 4, 9, 14, 19, 24])
	plt.legend(["Element C", "Element Cl", "Element S"], 
	bbox_to_anchor=(1.3, 1), loc ="upper right")

	# plt.show()
	filename = 'MDS_scatter_image/' + chr(i+65) + '_js_C_Cl_S_coords.png'
	plt.savefig(filename, bbox_inches='tight', dpi = 600)