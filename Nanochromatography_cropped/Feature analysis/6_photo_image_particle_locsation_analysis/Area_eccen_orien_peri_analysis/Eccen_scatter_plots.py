import matplotlib.pyplot as plt
import os
from numpy import genfromtxt

# CMDS coordinates
try: 
    os.mkdir('Eccen_CMDS_scatter_image')
except OSError as error: 
    print(error)

font = {'family': 'serif',
        'color':  'black',
        'weight': 'bold',
        'size': 14,
        }

conditions = range(65, 65+9)
for i in conditions:
	CMDS_coordinates = genfromtxt('Eccentricity_MDS_coordinates/' + chr(i) + '.csv', delimiter=',')
	x = CMDS_coordinates[1:, 0]
	y = CMDS_coordinates[1:, 1]
	z = CMDS_coordinates[1:, 2]
	color = CMDS_coordinates[1:, 6]

	fig = plt.figure(figsize = (10, 7))
	ax = plt.axes(projection ="3d")
	
	my_cmap = plt.get_cmap('plasma')

	# Creating plot
	# print(MDS_coordinates[1:, 0])
	ax.scatter3D(x[0:5], y[0:5], z[0:5], c = 'red', alpha = 0.8, s = 50)
	ax.scatter3D(x[5:10], y[5:10], z[5:10], c = 'green', alpha = 0.8, s = 50)
	ax.scatter3D(x[10:15], y[10:15], z[10:15], c = 'blue', alpha = 0.8, s = 50)
	ax.scatter3D(x[15:20], y[15:20], z[15:20], c = 'yellow', alpha = 0.8, s = 50)
	ax.scatter3D(x[20:25], y[20:25], z[20:25], c = 'purple', alpha = 0.8, s = 50)

	plt.title("Images CMDS 3D coordiamntes under condition " + chr(i))

	ax.set_xlabel('Component 1', fontdict=font)
	ax.set_ylabel('Component 2', fontdict=font)
	ax.set_zlabel('Component 3', fontdict=font)

	# ax.set_xlabel(fontdict=font)

	# ax.set_xticks([0, 4, 9, 14, 19, 24])
	plt.legend(["Water sample 1", "Water sample 2", "Water sample 3", "Water sample 4", "Water sample 5"], 
	bbox_to_anchor=(1.3, 1), loc ="upper right")

	# plt.show()
	filename = 'Eccen_CMDS_scatter_image/' + chr(i) + '_js_coordinates.png'
	plt.savefig(filename, bbox_inches='tight', dpi = 600)


# MDS coordinates
try: 
    os.mkdir('Eccen_MDS_scatter_image')
except OSError as error: 
    print(error)

conditions = range(65, 65+9)
for i in conditions:
	MDS_coordinates = genfromtxt('Eccentricity_MDS_coordinates/' + chr(i) + '.csv', delimiter=',')
	x = MDS_coordinates[1:, 3]
	y = MDS_coordinates[1:, 4]
	z = MDS_coordinates[1:, 5]
	color = MDS_coordinates[1:, 6]

	fig = plt.figure(figsize = (10, 7))
	ax = plt.axes(projection ="3d")
	
	my_cmap = plt.get_cmap('plasma')

	# Creating plot
	# print(MDS_coordinates[1:, 0])
	ax.scatter3D(x[0:5], y[0:5], z[0:5], c = 'red', alpha = 0.8, s = 50)
	ax.scatter3D(x[5:10], y[5:10], z[5:10], c = 'green', alpha = 0.8, s = 50)
	ax.scatter3D(x[10:15], y[10:15], z[10:15], c = 'blue', alpha = 0.8, s = 50)
	ax.scatter3D(x[15:20], y[15:20], z[15:20], c = 'yellow', alpha = 0.8, s = 50)
	ax.scatter3D(x[20:25], y[20:25], z[20:25], c = 'purple', alpha = 0.8, s = 50)

	plt.title("Images MDS 3D coordiamntes under condition " + chr(i))

	ax.set_xlabel('Component 1', fontdict=font)
	ax.set_ylabel('Component 2', fontdict=font)
	ax.set_zlabel('Component 3', fontdict=font)

	# ax.set_xlabel(fontdict=font)

	# ax.set_xticks([0, 4, 9, 14, 19, 24])
	plt.legend(["Water sample 1", "Water sample 2", "Water sample 3", "Water sample 4", "Water sample 5"], 
	bbox_to_anchor=(1.3, 1), loc ="upper right")

	# plt.show()
	filename = 'Eccen_MDS_scatter_image/' + chr(i) + '_js_coordinates.png'
	plt.savefig(filename, bbox_inches='tight', dpi = 600)