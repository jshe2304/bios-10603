proc distance {seltext1 seltext2 outfilename} {

	set sel1 [atomselect top $seltext1]
	set sel2 [atomselect top $seltext2]
	
	set outfile [open $outfilename "w+"]

	set num_frames [molinfo top get numframes]

	for {set i 0} {$i < $num_frames} {incr i} {
		$sel1 frame $i
		$sel1 update

		$sel2 frame $i
                $sel2 update

		set center1 [measure center $sel1]
		set center2 [measure center $sel2]

		puts $outfile [vecdist $center1 $center2]	
	}

	close $outfile
}
