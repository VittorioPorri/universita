const express = require('express')
const cors = require('cors')
const fs = require("fs")
const data = JSON.parse(fs.readFileSync("data.json"))

const app = express()

app.use(express.json())
app.use(cors())

/*Express restituisce automaticamente il file home.html*/ 
app.use('/', express.static("public", { index: 'home.html' }));

let count = {
    "counter" : 5
}

let color = {
    "background": "#882200",
    "text" : "#44DDAA"
}

app.get("/counter", (req,res) => {
    res.status(200).json(count)
})

app.get("/color",(req,res) => {
    res.status(200).json(color)
})

app.post("/increase",(req,res) => {
    count.counter++
    res.status(200).json(count)
})

app.post("/decrease",(req,res) => {
    count.counter--
    res.status(200).json(count)
})

app.listen(3000, () =>
    console.log("Running")
)