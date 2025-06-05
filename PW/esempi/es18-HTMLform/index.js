const express = require('express')
const app = express()
const bodyparse = require('body-parser')

app.use(express.static('public'))
app.use(bodyparse.urlencoded())

app.get("/elabData",(req,res)=>{
    const data = req.query
    let {corso, name} = req.query
    console.log(data)
    res.send(`<h1>dati ricevuti ${name}</h1>`)
})

app.post("/elabData",(req,res)=>{
    const data = req.body
    console.log(data)
    res.send(`<h1>dati ricevuti con POST</h1>`)
})


app.listen(8080, () => {
    console.log(`Running on port ${PORT}`)
})
