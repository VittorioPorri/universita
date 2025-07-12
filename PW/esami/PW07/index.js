const express = require('express')
const cors = require('cors')
const fs = require("fs")
const app = express()

app.use(express.json())
app.use(cors())
app.use('/', express.static("public", { index: 'home.html' }));

const data = JSON.parse(fs.readFileSync("data.json"))

app.get("/citations",(req,res) => {
    res.status(200).json(data)
})

app.get("/citation/:id",(req,res) => {
    const id = parseInt(req.params.id)
    const oggetto = data.find((el) => {return el.ID === id})
    
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