package require topotools

#topo readlammpsdata ../inputFiles/atomic.lmpsys
#mol addfile ../outputFiles/atomic.dcd waitfor all

mol load psf ../inputFiles/atomic.psf 
mol addfile ../outputFiles/atomic.dcd waitfor all

set sel1 [atomselect top all]
set sel2 [atomselect top all]

set rdf [measure gofr $sel1 $sel2 delta 0.1 rmax 15 usepbc 1 selupdate 1 first 1 last -1 step 1];
#set gr [measure gofr $sel1 $sel2 delta 0.1 rmax 15 usepbc 1 selupdate 1 first 2 last -1 step 1];   # when using a lammps data file

set r [lindex $rdf 0];
set gr [lindex $rdf 1];
set igr [lindex $rdf 2];

set fp [open rdf.dat w]
foreach j $r k $gr l $igr {
  puts $fp "$j $k $l"
  }
close $fp

exit
