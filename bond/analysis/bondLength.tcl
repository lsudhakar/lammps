mol load psf ../inputFiles/bond.psf
mol addfile ../outputFiles/bond.dcd waitfor all

set fp [open "bondLength.dat" w]

for {set i 0} {$i < 2} {incr i} {

set bondAtom1 $i
set bondAtom2 [expr $i+1]
set bondAtoms "$bondAtom1 $bondAtom2"
set bondLength [measure bond $bondAtoms frame all]

   puts $fp "$bondLength"
#foreach bl $bondLength {
#   puts $fp "$bl"
#}

}

close $fp

exit
