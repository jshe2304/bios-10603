set molnum "top"

set outfile [open "rg.dat" w+]
puts $outfile "Frame\tRG"

set sel [atomselect $molnum "resid 80 123 177 180"]
set frames [molinfo $molnum get numframes]

for { set i 0 } { $i <= $frames } { incr i } {

	$sel frame $i
	
	set rg [measure rgyr $sel]

	puts $outfile "$i \t $rg"	
}

close $outfile
