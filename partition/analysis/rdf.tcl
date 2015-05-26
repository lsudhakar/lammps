package require topotools
package require pbctools

#topo readlammpsdata ../InputFiles/216.lmpsys
#mol addfile ../OutputFiles/216.dcd waitfor all

mol load psf ../InputFiles/216.psf 
mol addfile ../OutputFiles/216.dcd waitfor all

set sel1 [atomselect top all]
set sel2 [atomselect top all]

set gr [measure gofr $sel1 $sel2 delta 0.1 rmax 15 usepbc 1 selupdate 1 first 1 last -1 step 1];

set r [lindex $gr 0];
set gr2 [lindex $gr 1];
set igr [lindex $gr 2];

foreach j $r k $gr2 l $igr {
   puts "$j $k $l \n"
}

set opfp [open rdf.dat w]
foreach j $r k $gr2 l $igr {
   puts $opfp "$j $k $l"
}
close $opfp

exit
