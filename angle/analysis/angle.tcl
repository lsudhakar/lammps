mol load psf ../inputFiles/angle.psf
mol addfile ../outputFiles/angle.dcd waitfor all

set fp [open "angle.dat" w]

for {set i 0} {$i < 9} {incr i} {

set angleAtom1 [expr $i]
set angleAtom2 [expr $i+1]
set angleAtom3 [expr $i+2]
set angleAtoms "$angleAtom1 $angleAtom2 $angleAtom3"
set angle [measure angle $angleAtoms frame all]

foreach ang $angle {
   puts $fp "$ang"
}

}

close $fp

exit
