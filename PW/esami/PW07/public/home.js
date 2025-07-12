const menu = document.getElementsByClassName("menu")[0]

function azione(id){
    fetch("/citation/"+id)
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const frase = document.getElementsByClassName("frase")[0]
        const valore = document.getElementsByClassName("valore")[0]

        frase.innerHTML=""
        valore.innerHTML=""

        frase.textContent = data.frase
        valore.textContent = data.valore
    })
    .catch(err =>{
        console.error(err)
    })
}


window.addEventListener("load", () =>{
    fetch("/citations")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const container = document.getElementsByClassName("containerArticoli")[0]
        for (let i = 0; i < data.length; i++) {
            let div = document.createElement("div")
            div.textContent = data[i].ID
            div.addEventListener("click", () =>{
                azione(data[i].ID)
            })
            menu.append(div)
        }
    })
    .catch(err =>{
        console.error(err)
    })
})