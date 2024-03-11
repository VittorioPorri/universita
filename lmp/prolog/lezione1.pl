/* Introduzione alla sintassi di prolog */
fratello(X,Y) :- genitore(Z,X), genitore(Z,Y).
genitore(mario,dario).
genitore(mario,gino).
genitore(pino,mario).

nonno(X,Y):- genitore(X,Z),genitore(Z,Y).

%induttivo
avo(X,Y):- genitore(X,Y).
avo(X,Y):- genitore(X,Z),avo(Z,Y).
