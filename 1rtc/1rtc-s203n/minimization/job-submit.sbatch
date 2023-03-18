#!/bin/sh

#SBATCH --job-name=1rtc-mini
#SBATCH --time=00:05:00
#SBATCH --exclusive
#SBATCH --partition=broadwl
#SBATCH --nodes=2
#SBATCH --ntasks-per-node=28
#SBATCH --account=bios10603

module load namd

mpirun -bootstrap=slurm namd2 "1rtc-s203n-mini.conf" > "1rtc-s203n-mini.log"

 
