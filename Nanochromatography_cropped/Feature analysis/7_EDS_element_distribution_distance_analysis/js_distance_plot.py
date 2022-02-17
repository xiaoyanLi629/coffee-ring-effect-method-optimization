import matplotlib.pyplot as plt
import os
from numpy import genfromtxt
import scipy.io

mat = scipy.io.loadmat('Ca_Mg_Na_js_distance_cond_old.mat')

js_distance_matrix = mat['js_cell']

try: 
    os.mkdir('Js_distances_matrix_image')
except OSError as error: 
    print(error)


conditions = range(65, 65+9)
for i in conditions:
	js_matrix = js_distance_matrix[i-65][0]

	fig1, ax1 = plt.subplots(figsize=(10,5))
	c = ax1.pcolor(js_matrix,cmap="Blues")
	ax1.set_ylim(ax1.get_ylim()[::-1])

	plt.title("Jensen-Shanon distance between nanochromatography images under condition  " + chr(i))

	ax1.xaxis.set_ticks_position('top')
	ax1.xaxis.set_label_position('top')

	ticks = list(range(0, 76, 15))
	ax1.set_xticks(ticks)
	ticklabels = []
	for ele in ticks:
		ticklabels.append('Img ' + str(ele))

	ax1.set_xticklabels(ticklabels)

	ax1.set_yticks(ticks)
	ax1.set_yticklabels(ticklabels)

	ax1.set_xlabel('Water sample nanochromatography images')
	ax1.set_ylabel('Water sample nanochromatography images')
	ax1.set_aspect('equal')
	plt.colorbar(c,ax=ax1)
	filename = 'Js_distances_matrix_image/' + chr(i) + '_js_Ca_Mg_Na_distance.png'

	plt.savefig(filename, bbox_inches='tight', dpi = 600)