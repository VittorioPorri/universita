let lista = []
let j = 4

window.addEventListener("load", () =>{
    fetch("/list")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        lista = data
        const galleria = document.getElementById("galleria")
        for (let i = 0; i < 4; i++) {
            let li = document.createElement("li")
            li.textContent = lista[i]
            li.addEventListener("click",() =>{
                azione(i)
                li.style.color = "green"
            })
            galleria.append(li)
        }
        
    })
    .catch(err =>{
        console.error(err)
    })
})


const bottone = document.getElementById("bottone")

bottone.addEventListener("click",()=>{
    for (let i = j; (i < j+4 && i < lista.length); i++) {
            let li = document.createElement("li")
            li.textContent = lista[i]
            li.addEventListener("click",() =>{
                azione(i)
                li.style.color = "green"
            })
            galleria.append(li)
        }
    j = j+4
})


function azione(i){
    let id = lista[i]
    fetch("/pics/"+ id)
        .then(res =>{
            if (!res.ok){
                throw new Error("Errore nel caricamento del file JSON")
            }
            return res.json()
        })
        .then(data =>{
            const desc = document.getElementById("desc")
            desc.innerHTML = ""
            desc.textContent = data.desc
            desc.setAttribute("class", "visibile")
        })
        .catch(err =>{
            console.error(err)
        })
}