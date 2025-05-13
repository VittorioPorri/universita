const dotenv =  require('dotenv')
const moment =  require('moment')
const chalk = require('chalk')
const { dot } = require('node:test/reporters')
const bl = require('betterlog')

/*
va installato e facendo `npm install moment` lo installa nella cartella node_modules in maniera locale 
*/
const now = moment()
dotenv.config()
bl("Ciao con il LOG")
console.log(process.env.APIKEY)
console.log(now.format("HH:mm:ss"))
console.log(chalk.red("Ciao a Tutti"))