

const { Client } = require('pg');
module.exports = {
    port:3000,
    clienteDB:  new Client({
        user: 'postgres',
        host: 'localhost',
        database: 'prueba',
        password: 'postgres',
        port: 5432,
    
      })
}