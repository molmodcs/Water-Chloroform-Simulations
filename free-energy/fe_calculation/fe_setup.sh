# Copy the ff file and final configuration from the last equilibration
cp ../npt_equilibration_2/sys_ff.top .
cp ../npt_equilibration_2/sys_npt.gro sys_input.gro

# In case it is not already loaded, load Gromacs
module load gromacs/2020.2

gmx_d grompp -f sys_input.0.mdp -c sys_input.gro -p sys_ff.top -o sys.0.tpr -po sys.0.mdp -maxwarn 4
gmx_d grompp -f sys_input.1.mdp -c sys_input.gro -p sys_ff.top -o sys.1.tpr -po sys.1.mdp -maxwarn 4
gmx_d grompp -f sys_input.2.mdp -c sys_input.gro -p sys_ff.top -o sys.2.tpr -po sys.2.mdp -maxwarn 4
gmx_d grompp -f sys_input.3.mdp -c sys_input.gro -p sys_ff.top -o sys.3.tpr -po sys.3.mdp -maxwarn 4
gmx_d grompp -f sys_input.4.mdp -c sys_input.gro -p sys_ff.top -o sys.4.tpr -po sys.4.mdp -maxwarn 4
gmx_d grompp -f sys_input.5.mdp -c sys_input.gro -p sys_ff.top -o sys.5.tpr -po sys.5.mdp -maxwarn 4
gmx_d grompp -f sys_input.6.mdp -c sys_input.gro -p sys_ff.top -o sys.6.tpr -po sys.6.mdp -maxwarn 4
gmx_d grompp -f sys_input.7.mdp -c sys_input.gro -p sys_ff.top -o sys.7.tpr -po sys.7.mdp -maxwarn 4
gmx_d grompp -f sys_input.8.mdp -c sys_input.gro -p sys_ff.top -o sys.8.tpr -po sys.8.mdp -maxwarn 4
gmx_d grompp -f sys_input.9.mdp -c sys_input.gro -p sys_ff.top -o sys.9.tpr -po sys.9.mdp -maxwarn 4
gmx_d grompp -f sys_input.10.mdp -c sys_input.gro -p sys_ff.top -o sys.10.tpr -po sys.10.mdp -maxwarn 4
gmx_d grompp -f sys_input.11.mdp -c sys_input.gro -p sys_ff.top -o sys.11.tpr -po sys.11.mdp -maxwarn 4
gmx_d grompp -f sys_input.12.mdp -c sys_input.gro -p sys_ff.top -o sys.12.tpr -po sys.12.mdp -maxwarn 4
gmx_d grompp -f sys_input.13.mdp -c sys_input.gro -p sys_ff.top -o sys.13.tpr -po sys.13.mdp -maxwarn 4
gmx_d grompp -f sys_input.14.mdp -c sys_input.gro -p sys_ff.top -o sys.14.tpr -po sys.14.mdp -maxwarn 4

# If grompp worked with an error, you are ready to submit!

################
# Upate the email address in the submission script
#
#sed -i 's/paluchas@miamioh.edu/test@test.com/g' script_*.sh
#sed -i 's/solvnt/your_solvent/g' script_*.sh
