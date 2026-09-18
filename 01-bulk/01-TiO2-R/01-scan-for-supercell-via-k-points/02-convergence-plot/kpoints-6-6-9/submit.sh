#!/bin/bash

#SBATCH -e slurm-%j.err
#SBATCH -o slurm-%j.out
#SBATCH --ntasks-per-node=36       ## Number of tasks per node
#SBATCH --cpus-per-task=1          ## Number of cpus used per task
#SBATCH --nodes=1                  ## Number of nodes to be used
#SBATCH -p short.36                ## Partition/jobqueue to be used
#SBATCH -t 1:00:00

inputfile=pw.in                                  ## Name of the input file
outputfile=output
#export ESPRESSO_PSEUDO=$SLURM_SUBMIT_DIR             ## Please place the required pseudopotential files in the job submission directory
exe=pw.x

#echo 'Nodes = '$SLURM_JOB_NODELIST

#Load required modules
module purge
module load QE/7.1/imkl_impi 

#Run Quantum Espresso
export I_MPI_HYDRA_BOOTSTRAP=ssh
(/usr/bin/time -p mpiexec -n $SLURM_NTASKS $exe < $inputfile > $outputfile)

exit 0
