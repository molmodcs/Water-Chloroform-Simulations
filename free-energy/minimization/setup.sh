#
# Make sure *_input.mdp is present in this directory and the two
# equilibration directories. This directory will also contain
# the script setup.sh (this file) and the job submission script. Update
# the jobs submission file for your system.

#
# Copy initial structure of solvated solute and force field file.
cp ../initial_config/sys_input.gro .

# I already have the top file updated here as sys_ff.top

############################################################
# Update the email address in the job submission file
#sed -i 's/paluchas@miamioh.edu/you@you.com/g' submit_job.sh
# Update job name
#sed -i 's/ethanol/solvent/g' submit_job.sh
# Update molecule name
#sed -i 's/ethanol/solvent/g' sys_ff.top
#sed -i 's/etOH/solvent/g' sys_ff.top
#sed -i 's/1004/number/g' sys_ff.top
############################################################

#
# Make sure Gromacs is loaded. If it isn't load it:
#
module load gromacs/2020.2
#
# Have Gromacs get everything set-up
gmx_d grompp -f sys_input.mdp -c sys_input.gro -p sys_ff.top -o sys_min.tpr -po sys_min.mdp -maxwarn 4

