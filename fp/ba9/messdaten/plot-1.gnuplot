set xlabel "Position [Pixel]"
set ylabel "Intensität [arbiträre Einheiten]"
set key off

set termoption dash
set style line 1 lt 1
set style line 2 lt 1
set style line 3 lt 2

set terminal epslatex size 27cm,18cm
set output "plot-1.tex"

set fit errorvariables
set samples 500
set xrange [0:1024]

A(x) = (0.0073449737157)*x*x+(-7.26093757579)*x+(4369.55426761)+(43484.4822494)/(1+((x-(61.5941266072))/((-15.8218016686)/2))**2)+(27789.2488582)/(1+((x-(295.441411843))/((86.8586381534)/2))**2)+(37689.6217314)/(1+((x-(530.245987526))/((17.2095449161)/2))**2)+(31095.9847965)/(1+((x-(631.198172937))/((16.4050338258)/2))**2)+(24500.6695261)/(1+((x-(710.198806574))/((11.7291433951)/2))**2)+(20578.5536222)/(1+((x-(775.337859558))/((10.9113105531)/2))**2)+(17309.2960158)/(1+((x-(832.638245544))/((10.5434052137)/2))**2)+(14969.9190477)/(1+((x-(884.473222351))/((9.65329546548)/2))**2)+(13241.3705861)/(1+((x-(931.880234727))/((8.97505309515)/2))**2)+(11277.3134083)/(1+((x-(976.025494298))/((8.22881992154)/2))**2)+(9240.67150554)/(1+((x-(1017.69432267))/((8.55874757917)/2))**2)

set label 1 "Aufgabe 5.4\nFitgleichung: Summe von\nQuadratischem Hintergrund $ax^2+bx+c$ mit $a=0.00734$, $b=-7.26$, $c=4370.0$\nLorentzian $a/(1+((x-p)/(f/2))^2)$ jeweils mit:\n$p=61.59$, $a=43480.0$, $f=-15.82$\n$p=295.4$, $a=27790.0$, $f=86.86$\n$p=530.2$, $a=37690.0$, $f=17.21$\n$p=631.2$, $a=31100.0$, $f=16.41$\n$p=710.2$, $a=24500.0$, $f=11.73$\n$p=775.3$, $a=20580.0$, $f=10.91$\n$p=832.6$, $a=17310.0$, $f=10.54$\n$p=884.5$, $a=14970.0$, $f=9.653$\n$p=931.9$, $a=13240.0$, $f=8.975$\n$p=976.0$, $a=11280.0$, $f=8.229$\n$p=1018.0$, $a=9241.0$, $f=8.559$" at graph 0.07, graph 0.97

plot "data-1.txt" using 1:2 ls 1, A(x) ls 2

