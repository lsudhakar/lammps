package require solvate

set molname "water"

solvate -minmax {{0 0 0} {40 40 40}} -o ${molname}

exit
