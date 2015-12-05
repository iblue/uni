set xlabel "Energie [MeV]"
set ylabel "Kanalzahl"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-1.tex"

set fit errorvariables

A(x) = __EQ__

set label 1 "Aufgabe 5.4\nFitgleichung: Summe von\n__PARAMS__" at graph 0.07, graph 0.9

plot "data-1.txt" using 1:2 ls 1, A(x) ls 2

