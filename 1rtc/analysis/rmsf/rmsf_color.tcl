set molnum 1 

set outfile [open "rmsf.dat" w]

set sel [atomselect $molnum "name CA"]

set nframes [expr {[molinfo $molnum get numframes] - 1}]

puts $outfile "Residue\tRMSF"

set rmsf [measure rmsf $sel first 750 last $nframes]

for {set i 0} {$i < [$sel num]} {incr i} { 

	set sel3 [atomselect $molnum "resid $i" frame 0]

	$sel3 set beta [lindex $rmsf $i]

	puts $outfile "$i \t [lindex $rmsf $i]"

}

set sel4 [atomselect $molnum protein]

$sel4 writepdb "rmsf.pdb"

close $outfile
