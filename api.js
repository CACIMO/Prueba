const express= require('express');
const app = express();
let bodyParser = require('body-parser')
let config = require("./config")
let controller = require("./controller")
const { Client } = require('pg');

config.clienteDB.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());

app.post('/cashout',async(req,resp)=>{
    
    let saldo = await controller.getSaldo();

    if(saldo){
        console.log(saldo)

        if(saldo.getsaldo && saldo.getsaldo >= req.body.Amount){

            if(req.body.Amount/10000>0){
            let transaccion = await controller.cashOut(req.body.Amount)

            resp.status(200).send('Transaccion Existosa')}
            else resp.status(403).send('Transaccion Rechazada, Ingrese multiplos de 10.000')
        }
        else resp.status(403).send('Transaccion Rechazada, Saldo insuficiente')
    }
    else resp.status(403).send('Transaccion Rechazada, Error al obtener saldo.')

})


app.listen(config.port,()=>console.log('Esta corriendo'))



