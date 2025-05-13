const moment = require('moment')

const bl = function(txt){
    console.log(moment().format("DD/MM/YYYY HH:mm:ss - ")+ txt)
}

module.exports = bl