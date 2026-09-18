import numpy as np
from ase.io    import read, write
from ase.calculators.espresso import Espresso

vacuum=10
pseudopotentials = {
    'O':  'O_ONCV_PBE-1.2.upf',
    'Ti': 'Ti_ONCV_PBE-1.2.upf',
    'Ru': 'Ru_ONCV_PBE-1.2.upf',
}

input_data = {
    'control': {
        'calculation': 'relax',
        'outdir': './Out',
        'pseudo_dir': '/cm/shared/apps/KO/pseudo/sg15',
        'tprnfor': True,
        'tstress': True,
        'nstep': 500,
    },
    'system': {
        'ecutwfc':      120,
	'occupations': 'smearing',
	'degauss':      0.02,
    },
    'electrons': {
        'mixing_beta': 0.4,
        'electron_maxstep': 200,
        'mixing_ndim': 20,
    },
    'ions': {
    },
}

atoms = read('POSCAR')
atoms.center(vacuum=vacuum, axis=2)  # vacuum Å of vacuum on each side along z

write(
    'input',
    atoms,
    format='espresso-in',
    input_data=input_data,
    pseudopotentials=pseudopotentials,
    kpts=(4, 9, 1),  # vac not k-ed
    koffset=(0, 0, 0),
)
