/*
  Le liste in Prolog vengono implementate con il metodo della testa-coda [H|T] dove:
  - H è l'elemento in testa
  - T é la coda della lista ovvero tutti gli elementi tranne T
*/

% Definire un predicato appartiene(X,L) che verifica se X appartiene a L

%caso base
appartiene(X,[X|_]).

%passo induttivo
appartiene(X,[_|T]):-
    appartiene(X,T).

% Definire un predicato concatena(A,B,C) che concatena due liste in una lista C 

%caso base
concatena([],A,A).

%passo induttivo
concatena([H|T],B,[H|L]):-
    concatena(T,B,L).

% Definire un predicato rivoltata(L,RL) che restituisco true se RL è la lista inversa di L

%caso base
inserimeto([],X,[X|[]]).

%posso induttivo
inserimeto([H|T],X,[H|L]):-
    inserimeto(T,X,L).
    
%caso base
rivoltata([],[]).

%passo induttivo
rivoltata([H|T],RL):-
    rivoltata(T,RT),
    inserimeto(RT,H,RL).

% Definire un predicato permutazione(A,B) che verifica se tutti gli elementi di A si torvano in B

%caso base
rimozione(X,[X|T],T).

%passo induttivo
rimozione(X,[H|T],[H|L]):-
  
    rimozione(X,T,L).

%caso base
permutazione([],[]).

%passo induttivo
permutazione([H|T],B):-
    length([H|T],L),
    length(B,L),
    rimozione(H,B,Z),
    permutazione(T,Z).

% Definire un predicato lunghezza(A,B) che restituisce la lunghezza della lista
% Utilizzare is significa unificare N con una valore numerico che puo essere una variabile già istanziata 

%caso base
lunghezza([],0).

%passo induttivo
lunghezza([_|T],N):-
    lunghezza(T,M),
    N is M+1.

% Definire un predicato numero_di_occorenze(A,B,C) dove A è la lista, B è l'elemento che cerchiamo, C il numero di occorenze

%caso base
numero_di_occorenze([],_,0).

%passo induttivo
numero_di_occorenze([X|T],X,N):-
    numero_di_occorenze(T,X,M),
    N is M+1.
numero_di_occorenze([_|T],X,N):-
    numero_di_occorenze(T,X,N).
