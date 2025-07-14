function azione(id){
    fetch("/tasks/complete/" + id, { method: "POST" })
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data => {
        console.log("Task completato con successo:", data)
    })
    .catch(err =>{
        console.error(err)
    })
}



window.addEventListener("load", () =>{
    fetch("/tasks")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const main = document.querySelector("main")
        for (let i = 0; i < data.length; i++) {
            let div = document.createElement("div")
            let p = document.createElement("p")
            let button = document.createElement("button")
            p.textContent = data[i].text
            button.textContent ="Completa"
            if (data[i].completed == false){
                div.setAttribute("class","daCompletare")
                button.setAttribute("class","attivo")
                button.addEventListener("click", ()=>{
                    azione(data[i].id)
                    div.setAttribute("class","completa")
                    button.setAttribute("class","inattivo")
                })
            }else{
                div.setAttribute("class","completa")
                button.setAttribute("class","inattivo")
            }
            div.append(p)
            div.append(button)
            main.append(div)
        }   
    })
    .catch(err =>{
        console.error(err)
    })
})