puts -nonewline "\n \t \t MolId: "
gets stdin molnum

puts -nonewline "\n \t \t Selection: "
gets stdin seltext

set sel [atomselect $molnum "$seltext"]
set protein [atomselect $molnum "protein"]
set n [molinfo $molnum get numframes]
set output [open "sasa.dat" w]

for {set i 0} {$i < $n} {incr i} {
	molinfo $molnum set frame $i
	set sasa [measure sasa 1.4 $protein -restrict $sel]
	puts "\t \t progress: $i/$n"
	puts $output "$i \t $sasa"
}
puts "\t \t progress: $n/$n"
puts "Done."	
puts "output file: sasa.dat"
close $output
