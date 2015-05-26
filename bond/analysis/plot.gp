#!/usr/local/bin/gnuplot -persist

binwidth = 0.02
set boxwidth binwidth

set terminal x11 1
plot  "bondLength.dat" u :1 w p pt 7 ps 3

set terminal x11 2
bin(x,width)=binwidth*floor(x/width+0.5)
plot  "bondLength.dat" using (bin($1,binwidth)):(1.0) title 'Not normalized' smooth freq with boxes
