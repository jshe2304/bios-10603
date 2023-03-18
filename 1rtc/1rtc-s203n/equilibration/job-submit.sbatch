#!/bin/sh

#SBATCH --job-name=1rtc-equil
#SBATCH --time=06:00:00
#SBATCH --exclusive
#SBATCH --partition=broadwl
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=28
#SBATCH --account=bios10603

module load namd

mpirun -bootstrap=slurm namd2 "1rtc-s203n-equil.conf" > "1rtc-s203n-equil.log"
 
