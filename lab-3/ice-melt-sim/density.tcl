proc density {rep_atom mass out_name log_file} {
	## LINE 1
	## Open the file $out_name for writing and set the resulting file as the variable $outfile.
	set outfile [open $out_name "w"]
    
  	puts $outfile "Frame\tDensity (g/cm^3)"

 	set sel [atomselect top "$rep_atom"]
 	set bound_box [atomselect top "$rep_atom"]
 	set num_steps [molinfo top get numframes]

 	set vol_data [open $log_file "r"]
 	set count 0
  	while { [gets $vol_data data] >= 0 } {
		set fields [regexp -all -inline {[^ ]+} $data]
		if {[lindex $fields 1] == "DCD"} {
			if {[lindex $fields 2] == "FREQUENCY"} {
				set frequency [lindex $fields 3]
				puts $frequency
				break
            		}
        	}
    	}
    	set TS -1
	
	## LINE 2
	## Begin a for loop using $i as the loop variable. We want $i to begin at zero, increment by one with every iteration, and stop when $i equals $num_steps
	for {set i 0} {$i < $num_steps} {incr i} {
		$sel frame $i
		$sel update
		$bound_box frame $i
		$bound_box update
		
		set molnum [expr [$sel num]]
		set avogadro [expr 6.02 * pow(10,23)]
		
		## LINE 3
		## Set the variable $moles to be the variable $molnum divided by $avogadro
		set moles [expr {$molnum / 3 / $avogadro}]

		## LINE 4
		## Set the variable $molmass to be the variable $moles times $mass
		set molmass [expr {$moles * $mass}]

		while { [gets $vol_data data] >= 0 } {
			set fields [regexp -all -inline {[^ ]+} $data]
			if {[lindex $fields 0] == "ENERGY:"} {
				set last_TS $TS
				set TS [lindex $fields 1]
				if {[expr {$TS % $frequency} == 0]} {
					if {$TS != $last_TS} {
						set volumeA3 [expr {[lindex $fields 18]}]
						break
					}
				}
			}
		}
		set conversion [expr {1.0 * pow(10,24)}]
		set volumeC3 [expr {$volumeA3 / $conversion}]

		## LINE 5
		## Set the variable $density to $molmass divided by $volumeC3
		set density [expr {$molmass / $volumeC3}]

		## LINE 6
		## Print the frame number ($i) and the density into the outfile
		puts $outfile "$i\t$density"
	}
    
	## LINE 7 
	## Close the outfile
	close $outfile
}
