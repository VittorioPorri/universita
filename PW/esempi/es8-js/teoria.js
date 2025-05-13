"use strict";

//Lezione 1

let myName = "lorenzo"; 

/* 
    Le variabili vanno dichiarate o con let o con var
    Il tipo della variabile viene assegnato dinamicamente in base a cosa viene messo al suo interno
*/

console.log(myName.toUpperCase());  //stampo su console 

/*
    In javascript vengono introdotti i metodi sulla falsa riga di java
    myName.toUpperCase()
*/

/*
    Per aiutare le persone javascript ha creato diversi problemi ad esempio:
    - "45" - 3 ritorna 42 
    - "45" + 3 ritorna "453" poichè interpreta il "+" come concatenazione
*/

/* 
    Per fare in modo che non faccia supposizioni azzardate possiamo utilizzare la modalità "use strict "in modo tale che 
    mi riporta gli errori
*/



//Lezione 2

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

//Lezione 3

/* 
    Gli oggetti in js sono costituiti da una coppia chiave valore da cui nasce JSON
        - let studente ={}
        - per definire una nuova proprietà basta studente.voto = 30 senza aver definito la proprietà precedentemente
        - Per eliminare una proprietà delete studente.voto

    Il Garbage Collector ogni tanto passa ed elimina gli oggetti non piu utili in memoria per evitare il memory leak

    Un oggetto può avere tra le altre sue proprità anche dei metodi
*/

let a = {"name" : "pippo"};

a.saluta = function (){alert("ciao" + this.name);}; //con this.qualcosa prendo i dati contenuti nell'oggetto

a.saluta() //invoco la funzione

function sayMyName(){
    alert("ciao" + this.name);
};

let b = {"name" : "pluto"}
//posso dare un funzione ad un oggetto anche cosi
b.saluta = sayMyName;

/*
    Per creare oggetti uguali o simili possiamo usare un costruttore
    nota: generalmente viene messa con la lettera maiuscola
*/ 

function User(name){
    this.name = name;
    this.admin = false;
}

let a = new User("pippo"); // il new è fondamentale


/*
I tipi primitivi sono:
    string, number, bigint, boolean, symbol, null e undefined
    hanno tutti dei metodi come gli oggetti 

Gli array sono contenitori di variabili anche con tipi diversi, 
sono oggetti con tutte proprietà numeriche

*/

let arr=[];
console.log(arr.length);
a.push(5);
a.push("ciao");

// quando rimuovo un elemento non lo restringe ma la lunghezza rimane invariata
delete arr[0]

arr.pop() //rimuove l'elemento in fondo e modifica anche la lunghezza dell'array

let giorni = {
    lunedi: "Lunedi",
    martedi: "Martedi",
    mercoledi: "Mercoledi",
    giovedi: "Giovedi",
    venerdi: "Venerdi",
    sabato: "Sabato",
    domenica: "Domenica"
}

giorni.unshift(giorni.pop()) // sposto l'ultimo elemento in cima la domenica

// Rimuovere elementi centrali della lista va fatto con splice

giorni.splice(3,3) //(index, numero di elementi da rimuovere)

/*Iterare sull'array
     - for ... in itera tutte le proprietà di un oggetto
     - for ... of itera per gli elementi di un array
     - nomeArray.forEach()


    la funzione Map permette di convertire o mappare un array in un altro
*/

let a = ["pippo", "pluto", "topolino"]
a.map((el)=> el.toUpperCase());

//Metodo che serve a calcolare un singolo valore dall'array
a.reduce((acc, el) => acc+el);


let products = [
    {name: "Prodotto1",price: 10},
    {name: "Prodotto2",price: 50},
    {name: "Prodotto3",price: 30},
];

let cart = {
    item: [],
    total: 0,
    addItem : function(product){
        this.item.push(product);
        this.total += product.price;
    }
}


//Lezione 4

/*
    Oggetto Window che rappresenta la finsetra del browsere e ha alcuni metodi buidin

    Come in molti linguaggi ci sono le eccezioni che possono essere gestite

    La differenza tra var e let è lo scope
        - var è il function block più vicino
        - let è l'enclosing block più vicino

*/

function test() {
    var a = 1;
    let b = 2;

    if (true) {
        var c = 3;
        let d = 4;
    }

    console.log(a); // ✅
    console.log(b); // ✅
    console.log(c); // ✅ ← perché `var` ha scope nel function block
    //console.log(d);  ❌ ← perché `let` ha scope nell'enclosing block
}

/*
    Le funzioni nested possono essere utili per scimmiottare la private di java, 
    queste in javascript sono chiamate Closure
*/

function counter(){
    //una volta terminata l'esecuzione della funzione counter questa variabile diventa invisibile
    let a = 0;
    return {
        /*
            le funzioni ritornate da counter possono accedere comunque alla variabile a
            poiche lo scope di let permette di renderla visibile in tutta la funzione counter
        */
        inc : function() {++a},
        dec : function() {--a},
        get : function() {return a},
        rest: function() {a = 0}
    }
}

let c = counter();
c.inc();
console.log(c.get);


//Lezione 5

/*  
    DOM (document object model) è un'interfaccia di programmazione per HTML, che fornisce
    una mappa struttrata del nostro documento

    Il DOM organizza la pagina come un albero dove ogni nodo è un elemento della pagina
    L'elemento radice di tale albero è document

    Selettori:
    - document.getElementById("miodiv") -> ritorna il nodo associato al div con id "miodiv"
    - document.getElementsByTagName("p") -> ritorna una NodeList degli elementi `p`
    - document.getElementsByClassName("miaclasse")-> ritorna una NodeList degli elementi con classe "miaclasse"
    - document.querySelectorAll("p .warning")-> permette di utlizzare selettori css e ritorna una NodeList

    Concetto di evento fondamentale in javascript
        ...

    Associare un evento a un elemento: 
        1. con un attributo HTML -> <body onclick="myfunction();"></body>
        2. con un metodo  -> document.getElementById("miodiv").onclick = ...
        3. con addEventListner -> addEventListener("click",myFunction);


    per fare in modo di eseguire il codice dopo che venga caricata la pagina
        - mettere script in fondo alla pagina
        - scrivere window.onload  = function(){.codice vario.}
        - defer prima di eseguire lo script aspetta che il DOM sia caricato <script defer src="calc.js"></script>
        - async è come defer ma lo script viene eseguito appena è pronto


    Esercizio per casa fare una tablla in cui aggiungere righe 
*/

