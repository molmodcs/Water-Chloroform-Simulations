# We need to compute the molar volume of pure water and pure chloroform.
# We will do this for our simulations of pure water (2 in 2) and pure
# chloroform (1 in 1). The second equilibration simulation is run for 
# 12 ns. Discard the first 2 ns as additional equilibration and average
# over the last 10 ns.
#
# Be sure to load Gromacs. Then copy this to your second equilibration
# directory and run. We will then compute the molar volume in our analysis
# spreadsheet.

gmx_d energy -f sys_npt.edr -o volume.xvg -b 2000
