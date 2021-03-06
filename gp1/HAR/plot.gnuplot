set datafile separator ","

FIT_LIMIT=1e-5

set xlabel "$\\Omega$ [1/s]"
set ylabel "$A_0$ [V]"
set key off
set samples 500

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot.tex"

set fit errorvariables

A(x) = a*x/sqrt((omega0**2 - x**2)**2 + 4*delta**2*x**2)
omega0 = 3.45
fit A(x) "messwerte-korrekt.csv" using 3:1:2 via omega0, delta, a
omega0_err = 0.009729934
A_err_p(x) = a*x/sqrt(((omega0+omega0_err)**2 - x**2)**2 + 4*delta**2*x**2)
A_err_n(x) = a*x/sqrt(((omega0-omega0_err)**2 - x**2)**2 + 4*delta**2*x**2)

set label 1 sprintf("\\textbf{Resonanzkurve}\n\nFitgleichung: $A(\\Omega) = \\frac{a \\Omega}{\\sqrt{\\del{\\omega_0^2 - \\Omega^2}^2 + 4 \\delta^2 \\Omega^2}}$\n\n$\\omega_0 = \\num{%1.6f+-%1.6f}$\n$\\delta = \\num{%1.6f+-%1.6f}$\n$a = \\num{%1.6f+-%1.6f}$", omega0, omega0_err, delta, delta_err, a, a_err) at graph 0.6, graph 0.6

#plot "messwerte.csv" using 1:3:2:4 w xyerrorbars ls 1 #, A(x) ls 2#, A_err_n(x) ls 3, A_err_p(x) ls 3
plot "messwerte-korrekt.csv" using 3:1:4:2 w xyerrorbars ls 1 , A(x) ls 2, "messwerte-inkorrekt.csv" using 3:1:4:2 w xyerrorbars ls 3, A_err_p(x) ls 3, A_err_n(x) ls 3

