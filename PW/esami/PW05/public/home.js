window.addEventListener("load", () =>{
    fetch("/articoli")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const container = document.getElementsByClassName("containerArticoli")[0]
        for (let i = 0; i < data.length; i++) {
            let articolo = document.createElement("article")
            let h3 = document.createElement("h3")
            h3.textContent = data[i].titolo
            let p = document.createElement("p")
            p.textContent = "Autore: " + data[i].autore
            let p1 = document.createElement("p")
            p1.textContent = data[i].contenuto
            let bottone = document.createElement("button")
            bottone.textContent = "Mostra Dettagli"
            bottone.addEventListener("click",()=>{
                alert("Titolo: " + data[i].titolo + "\nAutore: " + data[i].autore + "\nContenuto: Lorem ipsum dolor sit, amet consectetur adipisicing elit. Minima, adipisci!");
            })
            articolo.append(h3)
            articolo.append(p)
            articolo.append(p1)
            articolo.append(bottone)
            container.append(articolo)
        }
    })
    .catch(err =>{
        console.error(err)
    })
})

const menuBottone = document.getElementById("menuBottone")
const menu = document.getElementById("menu")

function aggiorna(){
    if(window.innerWidth < 1000){
        menuBottone.setAttribute("class","visibile")
        menu.setAttribute("class","nascondi")
    }else{
        menuBottone.setAttribute("class","nascondi")
        menu.setAttribute("class","visibile")
    }
}
window.addEventListener("load", aggiorna);
window.addEventListener("resize",aggiorna)

menuBottone.addEventListener("click", () => {
    if(menu.getAttribute("class") == "nascondi"){
        menu.setAttribute("class","visibile")
    }else{
        menu.setAttribute("class","nascondi")
    }
})


const bottone = document.getElementById("bottone")

bottone.addEventListener("click", () => {
    fetch("/autori")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const overlay = document.getElementById("overlay")
        const content = document.getElementsByClassName("content")[0]
        content.innerHTML = ""
        let ul = document.createElement("ul")
        for (let i = 0; i < data.length; i++) {
            let li = document.createElement("li")
            li.textContent = data[i]
            ul.append(li)
        }
        content.append(ul)
        overlay.setAttribute("class","over")
    })
    .catch(err =>{
        console.error(err)
    })
})


const chiudi = document.getElementById("chiudi")

chiudi.addEventListener("click", ()=>{
    const overlay = document.getElementById("overlay")
    overlay.setAttribute("class","nascondi")
})