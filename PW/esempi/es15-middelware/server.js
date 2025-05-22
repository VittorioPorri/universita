const express = require('express');
const morgan = require('morgan')
const cors = require('cors')
const app = express()
const PORT = 9090

//app.use(express.static('public'))
app.use(morgan('combined'))
app.use(cors())

const myMiddleware = function(req, res, next){
    console.log("test middleware")
    next()
}

app.use(myMiddleware)
app.use(express.static('public'))
app.get("/data", (req,res) =>{
    res.send("<h1>Ciao a tutti</h1>")
})

const checkAuth = function(req, res, next){
    const authHeader = req.headers["authorization"]
    if (authHeader === "Bearer passwordsegreta"){
        next()
    }else{
        res.status(401).send("Non autorizzato")
    }
}
const sendData =  function(req, res, next){
    res.json({"message": "tutto ok"})
}

app.get("/secure",[checkAuth,sendData])

app.listen(PORT,(err) => {
    if (err){
        console.error(err.message)
    }else{
        console.log(`Server in ascolto sulla porta ${PORT}`)
    }
})