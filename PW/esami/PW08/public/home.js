function aggiorna(){
    fetch("/prod")
    .then(res =>{
        if (!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const main = document.getElementById("content")
        for (let i = 0; i < data.length; i++) {
            let div = document.createElement("div")
            let prodotto = document.createElement("p")
            let numero = document.createElement("p")
            prodotto.textContent = data[i].prodotto
            numero.textContent = data[i].numero
            let n = parseInt(data[i].numero)
            div.style.color = data[i].colore
            div.addEventListener("click", () =>{
                if(n != 0){
                    n--
                    numero.innerHTML = ""
                    numero.textContent = n
                }               
            })
            div.append(prodotto)
            div.append(numero)
            main.append(div)
        }
    })
    .catch(err =>{
        console.error(err)
    })
}

window.addEventListener("load",()=>{
    setTimeout(aggiorna(),5000)
})