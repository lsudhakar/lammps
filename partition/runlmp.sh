#!/bin/bash

#PBS -q sstar  
#PBS -l nodes=1:ppn=8
#PBS -l walltime=07:00:00:00
cd $PBS_O_WORKDIR

module load lammps

mpirun -np 8 lmp_mine -partition 4x2  -in master.lmp -pscreen none -plog none

