const express = require('express');
const app = express()


console.log("test")

app.get("/", (req,res)=>{
    res.send("Ciao")
})
app.get("/ciao", (req,res)=>{
    res.send("Ciao bello metto cipolla")
})

const PORT = 8080
app.listen(PORT, (err)=>{
    console.log(`Server in ascolto sulla porta ${PORT}`)
})