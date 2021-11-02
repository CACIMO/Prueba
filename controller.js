
let config = require("./config")
module.exports = {

    getSaldo: (resolve, reject) =>
        new Promise((resolve, reject) => {
            config.clienteDB.query('SELECT getSaldo()')
                .then(response => {
                    resolve(response.rows[0])
                })
                .catch(err => {
                    reject(null)
                })
        }),

    cashOut: (monto) =>

        new Promise((resolve, reject) => {
            config.clienteDB.query(`select funtionRetirar(${monto})`)
                .then(response => {
                    resolve('')
                })
                .catch(err => {
                    reject(null)
                })
        }),




}