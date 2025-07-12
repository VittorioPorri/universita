window.addEventListener("load", ()=>{
   fetch("/data")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        for (let i = 0; i < data.length; i++) {
            console.log(`Elemento ${i}: con colore ${data[i].colore} e posizione (${data[i].pos_orizz},${data[i].pos_vert})`)
        }
    })
    .catch(err =>{
        console.error(err)
    })
})


const bottone = document.getElementById("bottone")

bottone.addEventListener("click",() =>{
    fetch("/data")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const main = document.getElementsByTagName("main")[0]
        for (let i = 0; i < data.length; i++) {
            let div = document.createElement("div")
            //div.textContent = `Elemento ${i}`
            div.style.background = data[i].colore
            div.style.position = "absolute"
            div.style.width = "10%"
            div.style.height = "10%"
            div.style.top = data[i].pos_vert + "%"
            div.style.left = data[i].pos_orizz + "%"
            div.addEventListener("click", () => 
                div.setAttribute("class","nascondi")
            )
            main.appendChild(div)
        }
    })
    .catch(err =>{
        console.error(err)
    })
})
