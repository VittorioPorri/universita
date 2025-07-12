window.addEventListener("load", () =>{
    fetch("/persone")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const content = document.getElementById("content")
        set = data
        set.sort(() => Math.random() - 0.5);
        for (let i = 0; i < data.length; i++) {
            const li = document.createElement("li")
            li.textContent = set[i].nome+ " " +set[i].cognome
            li.addEventListener("click",() =>{
                alert("Nome: " + set[i].nome+ " " +set[i].cognome +"\nEtà: " +set[i].età)
            })
            content.append(li)
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

const bottoncino = document.getElementById("bottoncino")

bottoncino.addEventListener("click", ()=>{
    const body = document.body
    body.style.backgroundColor = "#00796b"
    menu.style.color = "#313131"
})