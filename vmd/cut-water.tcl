package require topotools

set molname cnt-water
mol load psf ${molname}.psf pdb ${molname}.pdb 

set cnt [atomselect top "not water"]
#set cnt [atomselect top "type CA"]
set mm [measure minmax $cnt]
set rr [lindex $mm 1 0]
set zz [lindex $mm 1 2]

set dr 0.5
set rr [expr $rr+$dr]
set zz [expr $zz+$dr]


set sel [atomselect top "sqrt(x*x+y*y) < $rr and abs(z) < $zz"]
$sel writepdb ${molname}.pdb
$sel writepsf ${molname}.psf
topo writelammpsdata ${molname}.lmpsys

exit
