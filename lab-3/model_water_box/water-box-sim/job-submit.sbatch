#!/bin/sh

#SBATCH --job-name=water-box-sim
#SBATCH --time=01:00:00
#SBATCH --exclusive
#SBATCH --partition=caslake
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=48
#SBATCH --account=BIOS10603

module load namd/2.14

mpiexec.hydra -bootstrap=slurm namd2 "H2O-mini-heatup-equil-NPT1.conf" > "H2O-mini-heatup-equil-NPT1.log"



