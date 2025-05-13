//console.log("Ciao Mondo");
const fs = require("fs"); 

fs.readFile("data.txt",(err,data)=>{
    if(err){
        console.error(err.message);
    }
    console.log("ASYNC: "+ data);
});

const data = fs.readFileSync("data.txt", "utf-8") //legge il file e ne ritorna il contenuto 

console.log(data)