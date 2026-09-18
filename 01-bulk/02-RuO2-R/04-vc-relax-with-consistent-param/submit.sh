#!/bin/bash

#SBATCH -e _slurm-%j.out
#SBATCH -o _slurm-%j.out
#SBATCH --ntasks-per-node=36       ## Number of tasks per node
#SBATCH --cpus-per-task=1          ## Number of cpus used per task
#SBATCH --nodes=1                  ## Number of nodes to be used
#SBATCH -p short.36                ## Partition/jobqueue to be used
#SBATCH -t 1:00:00

source ~/grp-apps/venv/deepmd-kit/bin/activate 
python 02-convert-vasp-to-pw.py
deactivate

module purge
module load QE/7.1/imkl_impi 


#Run Quantum Espresso
export I_MPI_HYDRA_BOOTSTRAP=ssh
mpiexec -n $SLURM_NTASKS pw.x < input > output
