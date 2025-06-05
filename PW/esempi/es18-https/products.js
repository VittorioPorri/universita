const express = require('express')
const fs = require('fs')
const { syncBuiltinESMExports } = require('module')

const router = express.Router()
const wine_list = JSON.parse(fs.readFileSync("data/products.json"))

router.get("/",(req,res)=>{
    res.json({
        status: "success",
        data : wine_list
    })
})

router.get("/:id",(req,res)=>{
    const id = req.params.id
    const wine = wine_list.find((el)=> el.id == id)
    
    if(!wine){
        return res.status(404).json({
            status : "fail",
            message: "Id non trovato"
        })
    }

    res.json({
        status: "success",
        data : wine
    })
})

router.post("/",(req,res)=>{
    const data = req.body
    console.log(data)

    if(!data.nome || !data.cantina){
        return res.status(422).json({
            status : "error",
            message : "Dati mancanti"
        })
    }
    const newId = wine_list[wine_list.length-1].id+1
    data.id = newId
    wine_list.push(data)

    res.json({
        status: "success",
        data : data
    })
})

module.exports = router

albero(tempo,[sottoalbero(incerto, albero(attrazioni,[sottoalbero(molte,andare),sottoalbero(poche,albero(distanza,[sottoalbero(vicino,andare),sottoalbero(lontano, non_andare)]))])),sottoalbero(piovoso,albero(distanza,[sottoalbero(vicino,andare),sottoalbero(lontano,non_andare)])),sottoalbero(sereno,andare)]).
