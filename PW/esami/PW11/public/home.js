window.addEventListener("load", () =>{
    fetch("/items")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const content = document.getElementsByClassName("content")[0]
        for (let i = 0; i < data.length; i++) {
            let div = document.createElement("div")
            div.setAttribute("id","box")
            let p = document.createElement("p")
            let button = document.createElement("button")
            p.textContent = data[i].testo
            button.textContent ="Completa"
            if (data[i].completato == false){
                div.setAttribute("class","daCompletare")
            }else{
                div.setAttribute("class","completa")
                button.setAttribute("class","inattivo")
            }
            div.append(p)
            div.append(button)
            content.append(div)
        }   
    })
    .catch(err =>{
        console.error(err)
    })
})


const tutti = document.getElementsByClassName("tutti")[0]
const completati = document.getElementsByClassName("completati")[0]

tutti.addEventListener("click",() =>{
    fetch("/items")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const content = document.getElementsByClassName("content")[0]
        content.innerHTML=""
        for (let i = 0; i < data.length; i++) {
            let div = document.createElement("div")
            div.setAttribute("id","box")
            let p = document.createElement("p")
            let button = document.createElement("button")
            p.textContent = data[i].testo
            button.textContent ="Completa"
            if (data[i].completato == false){
                div.setAttribute("class","daCompletare")
            }else{
                div.setAttribute("class","completa")
                button.setAttribute("class","inattivo")
            }
            div.append(p)
            div.append(button)
            content.append(div)
        }   
    })
    .catch(err =>{
        console.error(err)
    })
})

completati.addEventListener("click",() =>{
    fetch("/items-complete")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const content = document.getElementsByClassName("content")[0]
        content.innerHTML=""
        for (let i = 0; i < data.length; i++) {
            let div = document.createElement("div")
            div.setAttribute("id","box")
            let p = document.createElement("p")
            let button = document.createElement("button")
            p.textContent = data[i].testo
            button.textContent ="Completa"
            if (data[i].completato == false){
                div.setAttribute("class","daCompletare")
            }else{
                div.setAttribute("class","completa")
                button.setAttribute("class","inattivo")
            }
            div.append(p)
            div.append(button)
            content.append(div)
        }   
    })
    .catch(err =>{
        console.error(err)
    })
})

const tema = document.getElementsByClassName("tema")[0]

tema.addEventListener("click",()=>{
    const body = document.body
    const header = document.querySelector("header")
    const footer = document.querySelector("footer")
    const boxes = document.getElementsByClassName("box")
    if (body.getAttribute("class") === "chiaro"){
        body.setAttribute("class", "scuro")
        header.style.color = "#fff"
        footer.style.color = "#fff"

    }else {
        body.setAttribute("class", "chiaro"); 
        header.style.color = ""; 
        footer.style.color = "";
        
    }


})

