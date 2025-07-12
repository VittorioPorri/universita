const express = require('express')
const cors = require('cors')
const fs = require("fs")
const app = express()

app.use(express.json())
app.use(cors())
app.use('/', express.static("public", { index: 'home.html' }));

const data = JSON.parse(fs.readFileSync("data.json"))

app.get("/list",(req,res) => {
    const id = []
    for (let i = 0; i < data.length; i++) {
        id[i] = data[i].id
    }
    res.status(200).json(id)
})

app.get("/pics/:id",(req,res) => {
    const id = parseInt(req.params.id)
    const oggetto = data.find((el) => {return el.id === id})
    
    if (oggetto){
        res.status(200).json(oggetto)
    }else{
        res.status(404).json({"status":"error","msg":"id inesistente"})
    }
})


const err = {"status":"error","msg":"API not implemeted"}
app.use((req,res) =>{
   res.status(404).send(err) 
})

app.listen(3000, () =>
    console.log("Running")
)