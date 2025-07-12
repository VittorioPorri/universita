
:-op(500,xfy, mentre).
:-op(300,xfy,mangia). %prima esegue questa --> mangia(X,Y)
:-op(100,fx,il). % poi --> il(X)

%nota andrebbero definiti priorita per tutti gli articoli e per tutti i verbi presi in esame

il gatto mangia il topo.

il gatto mangia il topo mentre il cane mangia il bastone.

svo(S,mangia,O):- mangia(il(S),il(O)).
%nota il predicato va definito con ogni combinazione possibile tra verbo e articoli


sv(mangia, L):- mentre(mangia(il(S1),il(_)),mangia(il(S2),il(_))), append([S1],[S2],L). 

vo(mangia, L):- mentre(mangia(il(_),il(O1)),mangia(il(_),il(O2))), append([O1],[O2],L). 
