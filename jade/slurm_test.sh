#!/bin/bash --login
#SBATCH --nodes=1 # number of nodes
#SBATCH --cpus-per-task=16 # number of cores
#SBATCH --mem=64G # memory pool for all cores
#SBATCH -o slurm.%j.out # STDOUT
#SBATCH -e slurm.%j.err # STDERR
#SBATCH --ntasks-per-node=1
#SBATCH --gres=gpu:1
#SBATCH --partition=spot-gpu
#SBATCH --nodelist=egpu001
#SBATCH --mail-type=ALL
#SBATCH --mail-user=s01mz0@abdn.ac.uk
#SBATCH --signal=SIGUSR1@90



module load anaconda3
conda activate maxwell_pytorch


srun python test_jade_gpu.py #-c=~/sharedscratch/MaxwellConvAE/config_maxwell.conf --num_nodes 1 --gpus=1
