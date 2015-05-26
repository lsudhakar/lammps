package require topotools
package require pbctools

mol load psf ../InputFiles/binary.psf 
mol addfile ../OutputFiles/binary.dcd waitfor all

set sel1 [atomselect top all]
set sel2 [atomselect top all]
set rdf [measure gofr $sel1 $sel2 delta 0.1 rmax 15 usepbc 1 selupdate 1 first 50 last -1 step 1];

set sel1 [atomselect top "type A"]
set sel2 [atomselect top "type A"]
set rdfAA [measure gofr $sel1 $sel2 delta 0.1 rmax 15 usepbc 1 selupdate 1 first 50 last -1 step 1];

set sel1 [atomselect top "type B"]
set sel2 [atomselect top "type B"]
set rdfBB [measure gofr $sel1 $sel2 delta 0.1 rmax 15 usepbc 1 selupdate 1 first 50 last -1 step 1];

set sel1 [atomselect top "type A"]
set sel2 [atomselect top "type B"]
set rdfAB [measure gofr $sel1 $sel2 delta 0.1 rmax 15 usepbc 1 selupdate 1 first 50 last -1 step 1];

set r [lindex $rdf 0];
set gr [lindex $rdf 1];
set igr [lindex $rdf 2];

set grAA [lindex $rdfAA 1];
set igrAA [lindex $rdfAA 2];

set grBB [lindex $rdfBB 1];
set igrBB [lindex $rdfBB 2];

set grAB [lindex $rdfAB 1];
set igrAB [lindex $rdfAB 2];

set opfp [open rdf.dat w]
foreach j $r k $gr l $igr kAA $grAA lAA $igrAA kBB $grBB lBB $igrBB kAB $grAB lAB $igrAB {
   puts $opfp "$j $k $l $kAA $lAA $kBB $lBB $kAB $lAB"
}
close $opfp

exit
