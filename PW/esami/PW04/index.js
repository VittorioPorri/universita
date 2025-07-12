const express = require('express')
const cors = require('cors')
const fs = require("fs")
const app = express()

app.use(express.json())
app.use(cors())
app.use('/', express.static("public", { index: 'home.html' }));

const data = JSON.parse(fs.readFileSync("data.json"))

app.get("/data",(req,res) => {
    res.status(200).json(data)
})

app.listen(3000, () =>
    console.log("Running")
)