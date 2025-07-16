const menu = document.getElementById("menu")
const bottone = document.getElementById("bottone")

function aggiorna(){
    if(window.innerWidth < 900){
        menu.setAttribute("class","nascondi")
        bottone.setAttribute("class","")
    }else{
        menu.setAttribute("class","visibile")
        bottone.setAttribute("class","nascondi")
    }
}
window.addEventListener("load", aggiorna);
window.addEventListener("resize",aggiorna)

bottone.addEventListener("click",()=>{
    const menu = document.getElementById("menu")
    if(menu.getAttribute("class") === "nascondi"){
        menu.setAttribute("class","visibile")
    }else{
        menu.setAttribute("class","nascondi")
    }   
})