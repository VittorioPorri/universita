"use strict";

function moveDiv(){
    let div = document.getElementById("myDiv");
    let body = document.body;
    let rndX = Math.floor(Math.random() * (window.innerWidth -300));
    let rndY = Math.floor(Math.random() * (window.innerHeight -200));
    div.style.position = "absolute";
    div.style.left = rndX + "px";
    div.style.right= rndY + "px";

    if(div.style.backgroundColor == "black"){
        body.style.backgroundColor = "black";
        div.style.backgroundColor = "white";
    }else{
        body.style.backgroundColor = "white";
        div.style.backgroundColor = "black";
    }
}

setInterval(moveDiv, 5000);
