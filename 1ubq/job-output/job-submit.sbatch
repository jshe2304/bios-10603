#!/bin/sh

#SBATCH --job-name=1ubq-simulation
#SBATCH --time=02:00:00
#SBATCH --exclusive
#SBATCH --partition=caslake
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=28
#SBATCH --account=bios10603

module load namd/2.14

mpiexec.hydra -bootstrap=slurm namd2 "1UBQ-mini-heatup-equil.conf" > "1UBQ-mini-heatup-equil.log"
