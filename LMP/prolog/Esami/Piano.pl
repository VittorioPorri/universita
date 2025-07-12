len([], 0).
len([_|T],X):- 
    len(T,N), 
    X is N+1.

isRigaOK([]).
isRigaOK([H|T]):-
    len(H,N),
    N =:= 5,
    isRigaOK(T).

isPianoOK(L):-
    len(L,N),
	N =:= 10,
    isRigaOK(L).

consecutivo(_,[],0).
consecutivo(A,[H|_],0):-
    A \= H.

consecutivo(A,[A|T],N):-
    consecutivo(A,T,M),
    N is M+1.


isAinRiga(A,Len,Riga):-
	consecutivo(A,Riga, N),
    N >= Len.

isAinRiga(A,Len,[_|T]):-
	isAinRiga(A,Len,T).


isAinPiano(A,Len,[H|_]):-
    isAinRiga(A,Len,H).

isAinPiano(A,Len,[_|T]):-
    isAinPiano(A,Len,T).
    
    
lineaOrizzontale(A,Len, Piano):-
    isPianoOk(Piano),
    isAinPiano(A,Len,Piano).

startDellaSequenza(A,Lato,Riga,P,P):-
    consecutivo(A,Riga, N),
    N >= Lato.

startDellaSequenza(A,Lato,[_|T],Curr,P):-
    Next is Curr+1,
    startDellaSequenza(A,Lato,T,Next,P).
    

verificaQuadrato(A,Lato,P,[H|T]):-
    

isAxAinPiano(A,Lato,[H|T]):-
    startDellaSequenza(A,Lato,H,0,P),
    verificaQuadrato(A,Lato,P,T).
	    
    
isAxAinPiano(A,Lato,[_|T]):-
    isAxAinPiano(A,Lato,T).


quadratoNelPiano(A, Lato, Piano):-
    isPianoOk(Piano),
    isAxAinPiano(A,Lato,Piano).




