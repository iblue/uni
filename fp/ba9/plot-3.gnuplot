set xlabel "Magnetfeld $B$ [T]"
set ylabel "Frequenzaufspaltung $\\Delta \\nu$ [GHz]"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-3.tex"

set fit errorvariables

A(x) = m*x
fit A(x) "data-3.txt" using 1:3:4 via m

set label 1 sprintf("Frequenzaufspaltung (Aufgabe 5.10 und 5.11)\nFitgleichung: $A(x) = m x$\n$m = \\num{%1.3f+-%1.3f}$", m, m_err) at graph 0.07, graph 0.9

plot "data-3.txt" using 1:3:2:4 w xyerrorbars ls 1, A(x) ls 2

