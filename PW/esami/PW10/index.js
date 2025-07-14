const express = require('express')
const cors = require('cors')
const fs = require("fs")
const app = express()

app.use(express.json())
app.use(cors())
app.use('/', express.static("public", { index: 'home.html' }));

const data = JSON.parse(fs.readFileSync("data.json"))

app.get("/tasks",(req,res) => {
    res.status(200).json(data)
})

app.post("/tasks/complete/:id",(req,res) => {
    const id = parseInt(req.params.id)
    for (let i = 0; i < data.length; i++) {
        if (data[i].id  === id){
            data[i].completed = true
            return res.status(200).json(data)
        }
        
    }
    res.status(404).json({"status":"error","msg":"id inesistente"})
})

const err = {"status":"error","msg":"API not implemeted"}
app.use((req,res) =>{
   res.status(404).send(err) 
})

app.listen(3000, () =>
    console.log("Running")
)


