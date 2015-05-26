package require solvate

set molname "gnc"

#solvate ${molname}.psf ${molname}.pdb -t 10.0 -o ${molname}-water

solvate ${molname}.psf ${molname}.pdb -minmax {{0 0 0} {40 30 20}}  -o ${molname}-water

exit
