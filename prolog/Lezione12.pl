/* Precedenza degli operatori
    
  2+3*5 = ?
  
  relazione di precedenza: con il simbolo A->B indico che A ha maggiore precedenza di B
   -  ->  +  ->  /  ->   *
  Associamo ad ogni operatore un valore quelli con priorità maggiore hanno un valore maggiore
  400 -> 300 -> 200 ->  100

  Definiamo un operatore :-op(Priorità,Posizione(fx o xfx o xfy o yfx), Nome).
  
  Nell'albero sintattico: i nodi devono avere un valore maggiore del figlio
  esempio:
                ha  
               /  \
              /    \
           mario   di
                  /  \
                 /    \
           macchina   dario

*/

:-op(300,xfy,ha).
:-op(200,xfy,di).

mario ha macchina di dario.
giovanni ha panino.
elena ha panino di giovanni.
giacomo ha borsa di pelle di daino.
gennaro ha borsa di pelle di nonna.

% la query è ?-Chi ha Cosa oppure ?-giacomo ha borsa di Cosa


%in prolog var(X) verifica se X è una variabile oppure no.
%in prolog nonvar(X) esegue l'opposto di var(X)

%esercizio risolvere il problema delle 8 regine in prolog
