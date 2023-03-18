# Original script from the VMD tutorial
# Modified by Bernard Xie for Lab 4
# 22 Jan 2016
#
# Measures the RMSD of a protein trajectory
# Usage: source rmsd.tcl
# Outputs calculations to the file rmsd.dat
#
# Can easily measure other densities with modification
# of atom selection and atom weight
#

# Lines of code that will need to be replaced are marked with
## LINE _
# Followed by a description of what that line of code should do

set filename "rmsd.dat"

set outfile [ open $filename w+ ]
# Open the file named $filename for writing, and set this file to the variable $outfile

puts $outfile "Frame\tRMSD"

set mol top
set num_steps [molinfo $mol get numframes]
# Set the variable $num_steps to the number of steps in the trajectory, which can
# be found with the command "molinfo $mol get numframes"

set reference [atomselect $mol "protein and backbone" frame 1]
# Set the variable $reference to the atomselection of $mol selecting the protein backbone 
# at the first frame, which can be done using "atomselect $mol "selection" frame i"

set compare [atomselect $mol "protein and backbone"]
#Set the variable $compare to the atom selection of $mol selecting the protein backbone


## LINE 5
# Write a for loop with the variable i, iterating from 0 to $num_steps
for {set i 0} {$i <= $num_steps} { incr i } {
	
	set compare [atomselect $mol "protein and backbone" frame $i] 
	# Set the variable $compare to frame i, using something similar to line 3

	# Compute how much we have to move $compare for alignment
	set trans_mat [measure fit $compare $reference]
	
	$compare move $trans_mat
	# Move the variable $compare by the amount set in $trans_mat
	# HINT: Instead of using "moveby", you want to use "move"
		
	set rmsd [measure rmsd $compare $reference]
	# Set the variable $rmsd to the result of "measure rmsd $compare $reference"
	
	puts -nonewline $outfile $i
	puts -nonewline $outfile "\t"
	puts $outfile $rmsd
	# Print the frame and rmsd value to the outfile seperated by a tab (\t)
}

close $outfile
# Close the outfile
