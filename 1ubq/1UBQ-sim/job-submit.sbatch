#!/bin/sh

#SBATCH --job-name=ubq-sim
#SBATCH --time=01:00:00
#SBATCH --exclusive
#SBATCH --partition=broadwl
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=28
#SBATCH --account=bios10602

module load namd

mpirun -bootstrap=slurm namd2 "1UBQ-mini.conf" > "1UBQ-mini.log"
