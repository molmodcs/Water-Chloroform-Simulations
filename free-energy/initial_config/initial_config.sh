#
# In case it is not already loaded, load gromacs. If it is loaded already, you can comment this out.
module load gromacs/2020.2

#
# You must additionally have the following file:
#      sys_pack.in


# First run packmol to pack a box of length 46 A
# with the desired number of molecules. We will assume
# here that the input file is named "sys_pack.in".
# The box is smaller than the desired target size because
# packmol does not account for periodic boundary conditions (PBC).
#
/users/PMIU0124/miu0105/Software/packmol-18.169/packmol < sys_pack.in

#
# The packed box will be of type .pdb and will be named
# "sys_pack.xyz".
#
# Convert from xyz to pdf for Gromacs. Note that when I would attempt
# to pack using PDB in packmol, I would get an error. So that is
# the reason for this extra step.
/users/PMIU0124/miu0105/Software/openbabel/openbabel-install/bin/obabel -ixyz sys_pack.xyz -opdb -O sys_pack.pdb

#
# Next, we will use gromacs to resize the box and convert
# the file type from .pdb to .gro. 
# Gromacs will create output a file "water_input.gro".
#
gmx_d editconf -f sys_pack.pdb -o sys_pack.gro -box 4.6 4.6 4.6 -bt cubic

# Before we proceed, the box generated has a box length of 4.6 nm. Note the
# size in editconf agrees with Packmol. If you make it larger, Gromacs will
# scale the position of all of the sites. So we will next need to open
# the output file and change the box size to 4.6 nm to account for PBC.
# Note this increase of 1 A is half the tolerance specified in the 
# Packmol input file.
sed 's/   4.60000   4.60000   4.60000/   4.70000   4.70000   4.70000/' sys_pack.gro > sys_input.gro
