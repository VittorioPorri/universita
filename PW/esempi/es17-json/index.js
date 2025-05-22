const express = require("express")
const fs = require("fs")


const app = express()
const data = JSON.parse(fs.readFileSync("prof.json"))


app.get("/api/v1/profs",(req, res)=>{
    res.status(200)
    res.json(data)
})

app.get("/api/v1/profs/:id",(req, res)=>{
    const id = parseInt(req.params.id)
    const prof = data.find((el) => {return el.id === id})
    if (prof){
        res.status(200).json(prof)
    }else{
        res.status(404).json()
    }
})

app.listen(3000, (err)=>{
    if (err){
        console.log(err.message)
    }else{
        console.log("Running")
    }
})


