const express = require('express')
const cors = require('cors')
const fs = require("fs")
const app = express()

app.use(express.json())
app.use(cors())
app.use('/', express.static("public", { index: 'home.html' }));

const data = JSON.parse(fs.readFileSync("data.json"))

app.get("/prod",(req,res) => {
    res.status(200).json(data)
})

app.get("/prod/:color",(req,res) => {
    const color = req.params.color
    const oggetti = []
    i = 0
    data.forEach(el => {
        if(el.colore === color){
            oggetti[i] = el
            i++
        }
    });
    
    if (oggetti.length > 0){
        res.status(200).json(oggetti)
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