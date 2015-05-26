package require nanotube
package require topotools

set molname "cnt"

nanotube -l 3 -n 10 -m 10 -b 0
set sel [atomselect top all]
$sel writepdb ${molname}.pdb
$sel writepsf ${molname}.psf
topo writelammpsdata ${molname}.lmpsys

exit
