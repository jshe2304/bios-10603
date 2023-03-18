set outfile [open "rmsf.dat" w+]
puts $outfile "Residue \t RMSF0 \t RMSF1"


set sel0 [atomselect 0 "name CA"]
set sel1 [atomselect 1 "name CA"]


set nframes0 [expr {[molinfo 0 get numframes] - 1}]
set nframes1 [expr {[molinfo 1 get numframes] - 1}]


set firstframe 750
set rmsf0 [measure rmsf $sel0 first $firstframe last $nframes0]
set rmsf1 [measure rmsf $sel1 first $firstframe last $nframes1]


for {set i 0} {$i < [$sel0 num]} {incr i} { 
     puts $outfile "[expr {$i+1}]  \t  [lindex $rmsf0 $i] \t [lindex $rmsf1 $i]"
}

close $outfile
