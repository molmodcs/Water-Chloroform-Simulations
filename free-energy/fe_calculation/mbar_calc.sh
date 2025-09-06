#
# Script to facilitate mbar analysis of our fe simulations. The simulation are all 22 ns in length.
# We will disregard the first 2 ns (2000 ps) as equilibration and compute the average over the 
# last 20 ns.
#
# Copy this to the directory where you performed the solvation free energy calculation and run.
# I have the MBAR analysis tool installed locally in my home directory. You can readily download
# and install PyMBAR, and we have recordings for this exact install from our 2019 workshop.
#

export PYTHONPATH="$PYTHONPTH:/users/PMIU0124/miu0105/Software/pymbar-2.1.0:/users/PMIU0124/miu0105/Software/alchemical-analysis"

python /users/PMIU0124/miu0105/Software/alchemical-analysis/alchemical_analysis/alchemical_analysis.py -p sys.dhdl -s 2000 -t 298.15 -u kBT 
