package require topotools

topo readlammpsdata water.lmpsys
set sel [atomselect top "type O"]
$sel set charge 0.0
set sel1 [atomselect top "type O and index < 256"]
$sel1 set type A
$sel1 set name A
set sel2 [atomselect top "type O and index > 255"]
$sel2 set type B
$sel2 set name B
$sel writepdb tmp.pdb
$sel writepsf tmp.psf

mol load pdb tmp.pdb psf tmp.psf
topo writelammpsdata binary.lmpsys

