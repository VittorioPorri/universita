const fs = require("fs")
const data = fs.readFileSync("data.json", "utf-8")

const data_json = JSON.parse(data)

data_json.forEach(element => {
    console.log(element)
});

const data2 = JSON.parse(fs.readFileSync("data2.json"))
console.log(data2.nome)

Object.entries(data2).forEach(([key, value]) => {
    console.log(`${key} : ${value}`);
});
//console.log(data)
