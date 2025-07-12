const express = require('express')
const cors = require('cors')
const fs = require("fs")
const app = express()

app.use(express.json())
app.use(cors())
app.use('/', express.static("public", { index: 'home.html' }));

const data = JSON.parse(fs.readFileSync("data.json"))


app.get("/articoli",(req,res) => {
    res.status(200).json(data)
})

app.get("/autori",(req,res) => {
    const autori = []
    for (let i = 0; i < data.length; i++) {
        autori[i] = data[i].autore
    }
    res.status(200).json(autori)
})

const err = {"status":"error","msg":"API not implemeted"}
app.use((req,res) =>{
   res.status(404).send(err) 
})

app.listen(3000, () =>
    console.log("Running")
)