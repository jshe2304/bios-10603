#!/bin/sh

#SBATCH --job-name=name_me
#SBATCH --time=00:00:00
#SBATCH --exclusive
#SBATCH --partition=caslake
#SBATCH --nodes=0
#SBATCH --ntasks-per-node=48
#SBATCH --account=

module load namd/2.14

mpiexec.hydra -bootstrap=slurm namd2 "configuration-name.conf" > "configuration-name.log"



