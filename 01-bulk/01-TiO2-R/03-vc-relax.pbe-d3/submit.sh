#!/bin/bash

#SBATCH -e slurm-%j.err
#SBATCH -o slurm-%j.out
#SBATCH --ntasks-per-node=36       ## Number of tasks per node
#SBATCH --cpus-per-task=1          ## Number of cpus used per task
#SBATCH --nodes=1                  ## Number of nodes to be used
#SBATCH -p short.36                ## Partition/jobqueue to be used
#SBATCH -t 1:00:00

module purge
module load QE/7.1/imkl_impi 

export I_MPI_HYDRA_BOOTSTRAP=ssh
mpiexec -n $SLURM_NTASKS pw.x < input > output

