#!/bin/bash
#
# Gromacs submission script for Pitzer
#
#SBATCH --job-name=sys_moni_C_C
#SBATCH --mail-user=amoni@id.uff.br
#SBATCH --mail-type=END
#SBATCH --nodes=1 --ntasks-per-node=10
#SBATCH --time=36:00:00
#SBATCH --account=PMIU0124

# Load Gromacs
module load gromacs/2020.2

# Open directory from which the job was submitted
cd $SLURM_SUBMIT_DIR

# Run minimization
gmx_d mdrun -nt $SLURM_NTASKS -deffnm sys_min

# Next, equilibration with Berendsen thermostat and barostat.
# We will need the final configuration from the minimization along
# with the force field file.
cp sys_ff.top ../npt_equilibration_1/
cp sys_min.gro ../npt_equilibration_1/sys_input.gro
# Move to that directory, get the job setup, and then submit!
cd ../npt_equilibration_1
gmx_d grompp -f sys_input.mdp -c sys_input.gro -p sys_ff.top -o sys_npt.tpr -po sys_npt.mdp -maxwarn 4
gmx_d mdrun -nt $SLURM_NTASKS -deffnm sys_npt

# Now repeat with the final equilibration step.
cp sys_ff.top ../npt_equilibration_2/
cp sys_npt.gro ../npt_equilibration_2/sys_input.gro
# Move to that directory, get the job setup, and then submit!
cd ../npt_equilibration_2
gmx_d grompp -f sys_input.mdp -c sys_input.gro -p sys_ff.top -o sys_npt.tpr -po sys_npt.mdp -maxwarn 4
gmx_d mdrun -nt $SLURM_NTASKS -deffnm sys_npt

