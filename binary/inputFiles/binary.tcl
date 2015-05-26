package require topotools
package require psfgen

mol load psf ../../atomic/InputFiles/atomic.psf pdb ../../atomic/InputFiles/atomic.pdb
set sel [atomselect top "index%2==0"]
$sel set type A
set sel [atomselect top "index%2!=0"]
$sel set type B
set sel [atomselect top all]
$sel writepsf binary.psf
$sel writepdb binary.pdb

topo writelammpsdata binary.lmpsys

exit

