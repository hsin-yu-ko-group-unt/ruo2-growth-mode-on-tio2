import numpy as np
from ase.io    import read, write
from ase.build import surface, make_supercell

def create_slab_from_cif(cif_file_name, miller, layers, vac, super_cell_matrix=np.diag([1, 1, 1])):
    bulk = read(cif_file_name)
    slab = surface(bulk, miller, layers=layers, vacuum=vac)
    slab_sup = make_supercell(slab, super_cell_matrix)
    return slab_sup

def write_slab_from_cif_to_poscar(cif_file_name, miller, layers, vac, super_cell_matrix=np.diag([1, 1, 1])):
    slab = create_slab_from_cif(cif_file_name, miller, layers, vac, super_cell_matrix=super_cell_matrix)
    poscar_name = cif_file_name+"_miller_"+str(miller[0])+str(miller[1])+str(miller[2])+"_"+str(layers)+"layers_vac_"+str(vac)+".vasp"
    write(poscar_name, slab, format="vasp")

for nl in range(4,10):
    write_slab_from_cif_to_poscar(cif_file_name="R-TiO2.cif", miller=(1,1,0), layers=nl, vac=10)

