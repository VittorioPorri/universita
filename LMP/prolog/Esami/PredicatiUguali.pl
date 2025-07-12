%converti( [H|T],L):-
   
    

isLista([]).
isLista([_|T]):-
    isLista(T).

stessaArita(P1, P2) :-
    %functor(foo(a, B), Name, Arity). restituisce Name=foo e Arity=2
    functor(P1, _, A1),
    functor(P2, _, A2),
    A1 =:= A2.
    
confrontaAnnidata([],[]).
confrontaAnnidata([H|T],[H1|T1]):-
    stessaArita(H,H1),
    confrontaAnnidata(T,T1).

confronta([],[]).
confronta([H|T],[H1|T1]):-
    isLista(H),
    isLista(H1),
	confrontaAnnidata(H,H1),!,
	confronta(T,T1).

confronta([H|T],[H1|T1]):-
    stessaArita(H,H1),
    confronta(T,T1).

%gli passi stringhe del tipo [r(X), [g(X), h(X)]]
haStessaStruttra(R1,R2):-
    %string_chars(R1,L1),
    %string_chars(R2,L3),
    %converti(L1, L2),
    %converti(L3, L4),
    confronta(L2,L4).%converti( [H|T],L):-
   
    

isLista([]).
isLista([_|T]):-
    isLista(T).

stessaArita(P1, P2) :-
    %functor(foo(a, B), Name, Arity). restituisce Name=foo e Arity=2
    functor(P1, _, A1),
    functor(P2, _, A2),
    A1 =:= A2.
    
confrontaAnnidata([],[]).
confrontaAnnidata([H|T],[H1|T1]):-
    stessaArita(H,H1),
    confrontaAnnidata(T,T1).

confronta([],[]).
confronta([H|T],[H1|T1]):-
    isLista(H),
    isLista(H1),
	confrontaAnnidata(H,H1),!,
	confronta(T,T1).

confronta([H|T],[H1|T1]):-
    stessaArita(H,H1),
    confronta(T,T1).

%gli passi stringhe del tipo [r(X), [g(X), h(X)]]
haStessaStruttra(R1,R2):-
    %string_chars(R1,L1),
    %string_chars(R2,L3),
    %converti(L1, L2),
    %converti(L3, L4),
    confronta(L2,L4).




%versione finale
convertiCorpo((A,B),[A|T]) :- 
    convertiCorpo(B,T).

convertiCorpo(A,[A]) :-
    A \= (_,_).
    
converti((H:-Body),[H,T]):-
    convertiCorpo(Body,T).


isLista([]).
isLista([_|T]):-
    isLista(T).

stessaArita(P1, P2) :-
    %functor(foo(a, B), Name, Arity). restituisce Name=foo e Arity=2
    functor(P1, _, A1),
    functor(P2, _, A2),
    A1 =:= A2.
    
confrontaAnnidata([],[]).
confrontaAnnidata([H|T],[H1|T1]):-
    stessaArita(H,H1),
    confrontaAnnidata(T,T1).

confronta([],[]).
confronta([H|T],[H1|T1]):-
    isLista(H),
    isLista(H1),
	confrontaAnnidata(H,H1),
	confronta(T,T1).

%inserisco un fallimento esplicito
confronta([H|_],[H1|_]):-
    isLista(H),
    isLista(H1),
	\+ confrontaAnnidata(H,H1),
    !,fail.

confronta([H|T],[H1|T1]):-
    stessaArita(H,H1),
    confronta(T,T1).

%gli passi stringhe del tipo [r(X), [g(X), h(X)]]
haStessaStruttra(R1,R2):-
    converti(R1, L1),
    converti(R2, L2),
    confronta(L1,L2).




