package require nanotube
package require topotools
package require psfgen

graphene -lx 4 -ly 3 -type zigzag -b 0
set sel [atomselect top all]
$sel set segname A
$sel writepdb 1graphene.pdb
$sel writepsf 1graphene.psf

graphene -lx 4 -ly 3 -type zigzag -b 0
set sel [atomselect top all]
$sel set segname B
$sel moveby {0 0 20}
$sel writepdb 2graphene.pdb
$sel writepsf 2graphene.psf


readpsf  1graphene.psf
coordpdb 1graphene.pdb
readpsf  2graphene.psf
coordpdb 2graphene.pdb
writepsf gnc.psf
writepdb gnc.pdb

exit
