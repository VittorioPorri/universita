const express = require('express')
const cors = require('cors')
const fs = require("fs")
const { compile } = require('morgan')
const app = express()

app.use(express.json())
app.use(cors())
app.use('/', express.static("public", { index: 'home.html' }));

const data = JSON.parse(fs.readFileSync("data.json"))

app.get("/items",(req,res) => {
    res.status(200).json(data)
})

app.get("/items-complete",(req,res) => {
    c = []
    j = 0
    for (let i = 0; i < data.length; i++) {
        if (data[i].completato === true){
            c[j] = data[i]
            j++
        }
    }
    
    res.status(200).json(c)
    
})

app.post("/increase",(req,res) => {
    count.counter++
    res.status(200).json(count)
})
// Ricorda quando fai un fetch("/increase", { method: "POST" }) è importante dire al server che sono post

const err = {"status":"error","msg":"API not implemeted"}
app.use((req,res) =>{
   res.status(404).send(err) 
})

app.listen(3000, () =>
    console.log("Running")
)


