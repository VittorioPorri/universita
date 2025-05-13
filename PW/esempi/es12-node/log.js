"use strict";

const TAG = "DEBUG - "
const debug = function(txt) {
    console.log(TAG+txt)
}

//exports.log = log; // puoi aggiungere roba all'oggetto esportato
module.exports = debug //si riferisce all'oggetto esportato 