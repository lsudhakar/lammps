package require topotools
package require pbctools

mol load psf ../inputFiles/water.psf 
mol addfile ../outputFiles/water.dcd waitfor all

set sel1 [atomselect top "type O"]
set sel2 [atomselect top "type O"]
set rdfoo [measure gofr $sel1 $sel2 delta 0.1 rmax 8 usepbc 1 selupdate 1 first 1 last -1 step 1];

set sel1 [atomselect top "type H"]
set sel2 [atomselect top "type H"]
set rdfhh [measure gofr $sel1 $sel2 delta 0.1 rmax 8 usepbc 1 selupdate 1 first 1 last -1 step 1];

set sel1 [atomselect top "type O"]
set sel2 [atomselect top "type H"]
set rdfoh [measure gofr $sel1 $sel2 delta 0.1 rmax 8 usepbc 1 selupdate 1 first 1 last -1 step 1];

set r [lindex $rdfoo 0];
set groo  [lindex $rdfoo 1];
set igroo [lindex $rdfoo 2];
set grhh  [lindex $rdfhh 1];
set igrhh [lindex $rdfhh 2];
set groh  [lindex $rdfoh 1];
set igroh [lindex $rdfoh 2];


set opfp [open rdf.dat w]
foreach j $r k $groo l $igroo m $grhh n $igrhh o $groh p $igroh {
   puts $opfp "$j $k $l $m $n $o $p "
}
close $opfp

exit
