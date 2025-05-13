"use strict";

document.getElementById("bottonebello").addEventListener("click",generaItems);
let lista = ["zucchine", "latte", "riso", "pollo", "pane", "candeggina"];
let count = 4;

function generaItems(){
    let table = document.getElementsByTagName("table")[0];

    let newRaw = document.createElement("tr");
    let newId = document.createElement("td");
    let text1 = document.createTextNode(count);
    let newItem = document.createElement("td");
    let text2 = document.createTextNode(lista[Math.floor(Math.random() *lista.length)]);
    
    newId.append(text1);
    newItem.append(text2);
    newRaw.append(newId);
    newRaw.append(newItem);

    table.append(newRaw);

    count++;
}