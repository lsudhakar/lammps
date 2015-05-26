package require psfgen 	 
topology top_all36_carb.rtf	 
#topology sugar.top	 
segment U {pdb sugar.pdb} 	 
coordpdb sugar.pdb U 	 
guesscoord; # abc 	 
writepdb sugar.pdb 	 
writepsf sugar.psf
exit	 
