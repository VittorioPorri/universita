const express = require("express")
const app = express()
const products = require("./products")

const PORT = 3000

app.use(express.json())
app.use("/api/v1/products",products)

app.listen(PORT,()=>{
    console.log(`Running sulla prota ${PORT}`)
})