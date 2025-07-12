const main = document.getElementsByClassName('conteiner')[0]

fetch('data.json')
.then(res =>{
    if (!res.ok){
        throw new Error("Errore nel caricamento del file JSON")
    }
    return res.json()
})
.then(data =>{
    for (let i = 0; i < data.length; i++) {
        let section = document.createElement('section')
        let h3 = document.createElement('h3')
        h3.textContent = data[i].titolo
        h3.style.color = "white"
        section.style.backgroundColor = data[i].colore
        section.append(h3)
        main.append(section)
    }
})
.catch(err =>{
    console.error(err)
})


const bottone = document.getElementById("bottone")

bottone.addEventListener("click", () => {
    const overlay = document.getElementsByClassName("overlay")[0]
    overlay.setAttribute("class","nascondi")
})