console.log("ciaoo!");

const promiseDeley = new Promise(function(resolve, reject){
    setTimeout(function(){
        //resolve("hai vinto!!")
        reject(new Error("Hai perso"));
    },5000);

});

promiseDeley.then((result =>console.log(result))).catch(console.error);