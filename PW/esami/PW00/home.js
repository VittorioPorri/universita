const main = document.getElementsByTagName("main")[0]


fetch("data.json")
.then(res =>{
    if(!res.ok){
        throw new Error("Errore nel caricamento del file JSON")
    }

    return res.json()
})
.then(data => {
    for (let i = 0; i < data.length; i++) {
        let articol = document.createElement('section')
        let titolo = document.createElement('h1') 
        titolo.textContent = data[i].titolo
        let content = document.createElement('p') 
        content.textContent = data[i].contenuto
        articol.append(titolo)
        articol.append(content)
        main.append(articol)
    } 
})
.catch(err =>{
    console.error(err)
})


const menu = document.getElementsByClassName("bottone")[0]
const lista = document.getElementById("lista")

menu.addEventListener("click" , () => {
    if(window.innerWidth < 1000){
        if(lista.getAttribute("class") === "nascondi"){
            lista.setAttribute("class","menuContainer")
            menu.style.color = "black"
        }else{
            lista.setAttribute("class","nascondi")
            menu.style.color = "red"
        }
    }
})


const articoli = document.getElementById("articoli")

articoli.addEventListener("click", () =>{
    fetch("data.json")
    .then(res =>{
        if(!res.ok){
            throw new Error("Errore nel caricamento del file JSON")
        }
        return res.json()
    })
    .then(data =>{
        const main = document.getElementsByClassName("articoliContainer")[0]
        main.innerHTML = ""
        let set = [0,1,2]
        set.sort(() => Math.random() - 0.5);
        for (let i = 0; i < set.length; i++) {
            let index = set[i]
            let articol = document.createElement('section')
            let titolo = document.createElement('h1') 
            titolo.textContent = data[index].titolo
            let content = document.createElement('p') 
            content.textContent = data[index].contenuto
            articol.append(titolo)
            articol.append(content)
            main.append(articol)
        } 
    })

})
