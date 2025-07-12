toNum(a, 1).
toNum(b, 2).
toNum(c, 3).
toNum(d, 4).
toNum(e, 5).
toNum(f, 6).
toNum(g, 7).
toNum(h, 8).
toNum(i, 9).
toNum(j, 10).
toNum(k, 11).
toNum(l, 12).
toNum(m, 13).
toNum(n, 14).
toNum(o, 15).
toNum(p, 16).
toNum(q, 17).
toNum(r, 18).
toNum(s, 19).
toNum(t, 20).
toNum(u, 21).
toNum(v, 22).
toNum(w, 23).
toNum(x, 24).
toNum(y, 25).
toNum(z, 26).

toNum('0', 0).
toNum('1', 1).
toNum('2', 2).
toNum('3', 3).
toNum('4', 4).
toNum('5', 5).
toNum('6', 6).
toNum('7', 7).
toNum('8', 8).
toNum('9', 9).



%converte una lista di lettere in un valore numerico
convertiNome([],0).
convertiNome([H|T],M):-
    toNum(H,N),
    convertiNome(T,Num),
    M is N + Num.

%converte una data in un valore numerico
convertiData([], 0).
convertiData(['-'|T], M):-
    convertiData(T, M).

convertiData([H|T], M):-
    toNum(H, N),
    convertiData(T, Num),
	M is N + Num.


messaggioPerPersona(Nome,DataNascita, DataGiorno, Messaggio):-
	string_chars(Nome, N),
	string_chars(DataNascita, DN),
	string_chars(DataGiorno, DG),
	convertiNome(N, M1),
	convertiData(DN,M2),
	convertiData(DG,M3),
	Tot is  M1+M2+M3,
	getMessaggio(Tot, Messaggio).
	

getMessaggio(N, 200) :-
    N > 0, N < 200.
getMessaggio(N, 400) :-
    N >= 200, N =< 400.
getMessaggio(N, 600) :-
    N > 400, N =< 600.
getMessaggio(N, 800) :-
    N > 600, N =< 800.
getMessaggio(N, 1000) :-
    N > 800, N =< 1000.
getMessaggio(N, 1001) :-
    N > 1000.






