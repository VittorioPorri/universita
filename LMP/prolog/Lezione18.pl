/*predicato contatore in salita*/


/*
 * 
 * ?- 'S'(N,[up,down,up,down,down],[]).
 * il predicato aumenta il valore di N se nella lista c'è scritto up
 * il predicato diminuisce il valore di N se nella lista c'è scritto down
 * 
 * nota(ciò che è scritto nelle graffe{} non vine considerato dalla grammatica)
 * 
 */

'S'(N)--> [up],'S'(M),{N is M+1}.
'S'(N)--> [down],'S'(M),{N is M-1}.
'S'(1)--> [up].
'S'(-1)--> [down].





