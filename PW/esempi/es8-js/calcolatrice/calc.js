"use strict";

/* Operatori di Comparazione
    == e != fa supposizioni
    === e !== verifca se sono stesso dato e stesso tipo

    Operatori logici  uguali a C 
    introduce un nuovo operatore ?? se a è null o undefined ritorna b

    if else e else if sono come su C


    Truthy and falsy
    Undefined, 0, "" sono interpretati come falso 

    switch cicli for e while uguali a C

    lo scope definisce la visibilità di una variabile
    - le variabili locali hanno un scope relativo al blocco della funzione stessa, variabili locali
    - le variabili fuori da ogni funzione sono variabili globali (sono pericolosissime
      perche sono visibili da tutti i file js)

*/
let n3 = 40;

// nei parametri posso impostare valori di default
function somma(a,b = 1){
    return a + b;
}
// È buona pratica fare prima della funzione una specifica

/**
 * Funzione per sommare due numeri
 * @param {number} a - primo numero
 * @param {number} b - secondo numero
 * @returns {number} - risultato della somma 
 */

function calcolatrice(){
    let n1,n2, ret;

    n1 = prompt("inserisci il primo numero"); // prompt restituisce l'output sotto forma di String
    n2 = prompt("inserisci il secondo numero");

    n1 = Number(n1);
    n2 = Number(n2);

    ret = somma(n1, n2);
    alert("La somma è " + ret);
}
//console.log(n1) n1 non è definita perche è locale alla funzione
console.log(n3) // la variabile n3 è globale

calcolatrice();

function ask(question, yes, no){
    if (confirm(question)){
        yes();
    }else{
        no();
    }
}

ask(
    "Do you agree?",
    function() {alert("you agreed.");},
    function() {alert("you canceled the execution");}
);

