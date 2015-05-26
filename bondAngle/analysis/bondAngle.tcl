mol load psf ../inputFiles/bondAngle.psf
mol addfile ../outputFiles/bondAngle.dcd waitfor all

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


set fp [open "bond.dat" w]

for {set i 0} {$i < 10} {incr i} {

set bondAtom1 [expr $i]
set bondAtom2 [expr $i+1]
set bondAtoms "$bondAtom1 $bondAtom2"
set bondLength [measure bond $bondAtoms frame all]

foreach bl $bondLength {
   puts $fp "$bl"
}

}
close $fp


exit
