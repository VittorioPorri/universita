"use strict"

//eseguita all'evento onLoad
window.addEventListener("load", () =>{
    fetch("/data")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const container = document.getElementsByClassName("container")[0]
        let pre = document.createElement("pre")
        pre.textContent = JSON.stringify(data,null,2) //impostatne usare stringify per scrivere array json
        container.append(pre)
    })
    .catch(err =>{
        console.error(err)
    })
})

const bottone = document.getElementById("bottone")

bottone.addEventListener("click",()=>{
    fetch("/data")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const container = document.getElementsByClassName("container")[0]
        container.innerHTML = ""
        let ul = document.createElement("ul")

        for (let i = 0; i < data.length; i++) {
            let li = document.createElement("li")
            li.textContent = data[i].prodotto + data[i].desc
            ul.append(li)
        }
        container.append(ul)
        bottone.setAttribute("class","nascondi")
    })
    .catch(err =>{
        console.error(err)
    })
})