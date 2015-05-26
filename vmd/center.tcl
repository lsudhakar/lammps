set molname "cnt"

mol load pdb ${molname}.pdb psf ${molname}.psf
set sel [atomselect top all]
set cen [measure center $sel]
$sel moveby [vecscale -1.0 $cen]
$sel writepdb ${molname}.pdb
$sel writepsf ${molname}.psf

exit
