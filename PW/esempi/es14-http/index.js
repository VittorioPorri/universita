const express = require('express');

const app = express()
const PORT = 8080

app.get("/",(req,res) =>{
    res.send("Home")
})

app.get("/info",(req,res) =>{
    res.send("Info")
})

app.get("/about",(req,res) =>{
    res.set("Content-Type", "text/plain")
    res.send("About")
})

app.post("/about",(req,res) =>{
    res.set("Content-Type", "text/plain")
    res.status(201).send("About con POST")
})

/*
app.get('/users/:id/aula/:aula',(req,res) =>{
    console.log(req.params)
    res.send("USER")
})
*/


const routerUsers = express.Router()

routerUsers.get("/logout", (req,res) =>{
    res.send("GET LOGOUT")
})

routerUsers.post("/login", (req,res) =>{
    res.send("POST LOGIN")
})

app.use("/users", routerUsers)

app.listen(PORT,(err) =>{
    console.log(`Server in ascolto sulla prota ${PORT}`)
})