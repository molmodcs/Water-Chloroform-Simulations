#!/bin/bash
#
# Gromacs submission script for Pitzer
#
#SBATCH --job-name=sys_moni_C_C_11
#SBATCH --mail-user=amoni@id.uff.br
#SBATCH --mail-type=END
#SBATCH --nodes=1 --ntasks-per-node=10
#SBATCH --time=36:00:00
#SBATCH --account=PMIU0124

# Load Gromacs
module load gromacs/2020.2

# Open directory from which the job was submitted
cd $PBS_O_WORKDIR

# Run minimization
gmx_d mdrun -nt $SLURM_NTASKS -deffnm sys.11 -dhdl sys.dhdl.11.xvg

