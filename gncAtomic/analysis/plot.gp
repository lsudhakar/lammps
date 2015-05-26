#!/usr/local/bin/gnuplot -persist

f(x)=1.0
set terminal x11 1
set xlabel "r (A)"
set ylabel "rdf g(r)"
plot "rdf.dat" u 1:2 w lp t "OO", "" u 1:4 w lp t "HH", "" u 1:6 w lp t "OH", f(x)

set terminal x11 2
set xlabel "r (A)"
set ylabel "Number integral g(r)"
plot "rdf.dat" u 1:3 w lp t "OO", "" u 1:5 w lp t "HH", "" u 1:7 w lp t "OH"
