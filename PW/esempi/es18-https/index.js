const express = require("express")
const fs = require("fs")
const https = require("https")

const PORT = 9000
const app = express()

const opt = {
    key : fs.readFileSync("cert/key.pem"),
    cert : fs.readFileSync("cert/cert.pem")
}

app.use(express.static('public'))

const server = https.createServer(opt,app)

server.listen(PORT, ()=>{
    console.log(`Server in ascolto sulla porta ${PORT}`)
})