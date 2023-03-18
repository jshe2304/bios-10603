# Original script by Esmael Haddadian and Kipp Johnson
# Modified by Bernard Xie for Lab 5
# 23 Jan 2016
#
# Measures the RG of a protein trajectory
# Usage: source rg.tcl
# Outputs calculations to the file rg.dat

# In this exercise, we are going to provide the pseudocode for the RG
# calculation, and you will need to write every line

## SETUP - This portion will be very similar to the setup of the RMSD script

# Select the top molecule using "molinfo top" command and set it to a molecule variable

set mol [molinfo top]

# Open a file called "rg.dat", and set this to a file variable

set filename "rg.dat"
set outfile [open $filename w+]

# Select only the protein atoms using "atomselect top protein", and set this result
# to a selection variable

set sel [atomselect top protein]

# Find the number of frames in the trajectory, using the command
# "molinfo (molecule variable) get numframes", and set this result to some frame variable


set frames [molinfo $mol get numframes]


# Write the string "Frame\tRG" to the file.  This will write the word "Frame", followed
# by a tab, followed by "RG".

puts $outfile "Frame\tRG"

## COMPUTATION - Like RMSD, we will be iterating over each frame of the trajectory

# Write a for loop to iterate over each frame of the trajectory.  The following commands
# will take place inside the loop.
for { set i 0 } { $i <= $frames } { incr i } {

# Set the selection to the current frame using the command
# "(selection variable) frame (iterator variable)"
	$sel frame $i

# Measure the RG of your selection, using the appropriate command, and set it to some
# RG variable
# The documentation for measure can be found here:
# http://www.ks.uiuc.edu/Research/vmd/vmd-1.9/ug/node135.html
	
	set rg [measure rgyr $sel]

# Write the string "(frame variable)\t(RG variable)" to your file.  The tab is used
# so that plotting software can recognize how the frame and RG are separated.
	
	puts -nonewline $outfile $i
        puts -nonewline $outfile "\t"
        puts $outfile $rg

# Close the for loop
}

# Close the output file

close $outfile
