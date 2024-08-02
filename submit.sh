#!/bin/bash
#SBATCH --nodes=4               # Number of nodes
#SBATCH --ntasks-per-node=1     # Number of MPI ranks per node
#SBATCH --ntasks-per-socket=1   # Number of MPI ranks per socket
#SBATCH --cpus-per-task=128      # number of HW threads per task (equal to OMP_NUM_THREADS*4)
#SBATCH --gres=gpu:4            # Number of requested gpus per node, can vary between 1 and 4
#SBATCH --mem=230000MB          # Memory per node
#SBATCH --time 0:20:00         # Walltime, format: HH:MM:SS
#SBATCH -A ICT22_CMSP_0
#SBATCH -p m100_usr_prod
##SBATCH --qos=m100_qos_dbg
#SBATCH --job-name=ice

#-------------------------------------------------------------------------------
# load necessary modules
module purge
module load autoload profile/deeplrn tensorflow/2.3.0--cuda--10.1
module load python/3.8.2  cuda/10.1  cudnn/7.6.5--cuda--10.1   nccl/2.7.8--cuda--10.1
module load spectrum_mpi/10.3.1--binary

mpirun -np 4 /m100/home/userexternal/zli00000/lammps/lammps-stable_29Sep2021/src/lmp_gpu -in input.lammps 

#export OMP_PROC_BIND=spread
#export OMP_PLACES=threads      # not necessary, it's the default
#export OMP_NUM_THREADS=32

#-------------------------------------------------------------------------------
# run simulations





