import matplotlib.pyplot as plt
import os
from numpy import genfromtxt

try: 
    os.mkdir('Area_js_distances_matrix_image')
except OSError as error: 
    print(error)


conditions = range(65, 65+9)
for i in conditions:
	js_matrix = genfromtxt('Area_js_matrix_adjusted/' + chr(i) + '.csv', delimiter=',')
	# print(js_matrix)

	fig1, ax1 = plt.subplots(figsize=(10,5))
	c = ax1.pcolor(js_matrix,cmap="Blues")
	ax1.set_ylim(ax1.get_ylim()[::-1])

	plt.title("Jensen-Shanon distance between nanochromatography images under condition  " + chr(i))

	ax1.xaxis.set_ticks_position('top')
	ax1.xaxis.set_label_position('top')

	ax1.set_xticks([0, 5, 10, 15, 20, 25])
	ax1.set_xticklabels(['Img 1', 'Img 5','Img 10','Img 15','Img 20','Img 25',])

	ax1.set_yticks([0, 5, 10, 15, 20, 25])
	ax1.set_yticklabels(['Img 1', 'Img 5','Img 10','Img 15','Img 20','Img 25',])

	ax1.set_xlabel('Water sample images')
	ax1.set_ylabel('Water sample images')
	ax1.set_aspect('equal')
	plt.colorbar(c,ax=ax1)
	filename = 'Area_js_distances_matrix_image/' + chr(i) + '_js_distance.png'

	plt.savefig(filename, bbox_inches='tight', dpi = 600)
