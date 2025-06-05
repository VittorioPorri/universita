const express = require('express')
const app = express()
const PORT = 8080


app.get('/',(req,res)=>{
    res.send(`<h1>Prova a digitare "/saluta" qui sopra</h1>`)
})

app.get('/saluta', (req,res)=>{
    res.send("<h1>Ciao Patatona ti sto rispondendo dal computer della cameretta</h1>")
})  

app.listen(PORT, (err)=>{
    if(err){
        console.error(err.message)
    }else{
        console.log("Running")
    }
})