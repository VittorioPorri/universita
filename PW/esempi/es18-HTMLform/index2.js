const express = require('express')
const app = express()
const cors = require('cors')
const PORT = 3000
app.use(express.json())
app.use(cors())


app.post("/data",(req,res)=>{
    const data = req.body
    console.log(data)

    res.json({
        status: "success",
        message: "dati ricevuti con successo"
    })
})
app.listen(PORT, () =>{
    console.log(`Running on ${PORT}`)
})