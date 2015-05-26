package require topotools
package require pbctools

topo readlammpsdata ../InputFiles/216.lmpsys
mol addfile ../OutputFiles/216.dcd waitfor all

#mol load psf ../InputFiles/216.psf 
#mol addfile ../OutputFiles/216.dcd waitfor all

set sel1 [atomselect top "type O"]
set sel2 [atomselect top "type O"]
set groo [measure gofr $sel1 $sel2 delta 0.1 rmax 8 usepbc 1 selupdate 1 first 2 last -1 step 1];

set sel1 [atomselect top "type H"]
set sel2 [atomselect top "type H"]
set grhh [measure gofr $sel1 $sel2 delta 0.1 rmax 8 usepbc 1 selupdate 1 first 2 last -1 step 1];

set sel1 [atomselect top "type O"]
set sel2 [atomselect top "type H"]
set groh [measure gofr $sel1 $sel2 delta 0.1 rmax 8 usepbc 1 selupdate 1 first 2 last -1 step 1];

set r [lindex $groo 0];
set gr2oo [lindex $groo 1];
set igroo [lindex $groo 2];
set gr2hh [lindex $grhh 1];
set igrhh [lindex $grhh 2];
set gr2oh [lindex $groh 1];
set igroh [lindex $groh 2];


set opfp [open rdf.dat w]
foreach j $r k $gr2oo l $igroo m $gr2hh n $igrhh o $gr2oh p $igroh {
   puts $opfp "$j $k $l $m $n $o $p "
}
close $opfp

exit
