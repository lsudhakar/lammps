package require topotools

set molname water
mol load psf ${molname}.psf pdb ${molname}.pdb 
set sel [atomselect top all]
topo writelammpsdata ${molname}.lmpsys

exit
