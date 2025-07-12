const bottone = document.getElementById("bottone");
const menu = document.getElementById("menu");

function aggirona(){
    if(window.innerWidth < 600){
        bottone.setAttribute("class","visibile")
        menu.setAttribute("class","nascondi")
    }else{
        bottone.setAttribute("class","nascondi")
        menu.setAttribute("class","visibile")
    }
}

bottone.addEventListener("click", () => {
    if(menu.getAttribute("class") === "nascondi"){
        menu.setAttribute("class","visibile")
    }else{
        menu.setAttribute("class","nascondi")
    }
})


window.addEventListener("resize",aggirona) 


fetch("/counter")
.then(res =>{
    if (!res.ok){
        throw new Error("Errore nel caricamento del file JSON")
    }
    return res.json()
})
.then(data =>{
    let p = document.getElementById("contatore")
    p.textContent = data.counter
})
.catch(err =>{
    console.error(err)
})


let diminuisci = document.getElementById("diminuisci")
diminuisci.addEventListener("click", () =>{
    fetch("/decrease", { method: "POST" })
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        let p = document.getElementById("contatore")
        p.textContent = data.counter
    })
    .catch(err =>{
        console.error(err)
})
})

let aumenta = document.getElementById("aumenta")

aumenta.addEventListener("click", () =>{
    fetch("/increase", { method: "POST" }) //importante dire al server che sono post
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        let p = document.getElementById("contatore")
        p.textContent = data.counter
    })
    .catch(err =>{
        console.error(err)
})
})

let colore = document.getElementById("colore")

colore.addEventListener("click", () =>{
    fetch("/color")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        let header = document.getElementsByTagName("header")[0]
        let footer = document.getElementsByTagName("footer")[0]
        header.style.backgroundColor = data.background
        header.style.color = data.text
        footer.style.backgroundColor = data.background
        footer.style.color = data.text
    })
    .catch(err =>{
        console.error(err)
    })
})
