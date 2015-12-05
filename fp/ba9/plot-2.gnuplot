set xlabel "Ringindex $i$"
set ylabel "$r_i^2$"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-2.tex"

set fit errorvariables

A(x) = m*x
fit A(x) "data-2.txt" using 1:5:6 via m

set label 1 sprintf("Bestimmung der Brennweite (Aufgabe 5.4)\nFitgleichung: $A(x) = m x$\n$m = \\num{%1.3f+-%1.3f}$", m, m_err) at graph 0.07, graph 0.9

plot "data-2.txt" using 1:5:6 w yerrorbars ls 1, A(x) ls 2

