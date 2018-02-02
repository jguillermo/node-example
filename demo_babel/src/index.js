'use strict';
import express from 'express'

import config from './config'

let _server;

const server = {
    start(){
        const app = express();

        config(app);


        app.get('/',(req, res, next)=>{
            res
                .status(200)
                .json({data:'metodo get'});
        });

        app.post('/',(req, res, next)=>{
            res
                .status(201)
                .json({data:'metodo post'});
        });

        app.put('/',(req, res, next)=>{
            res
                .status(201)
                .json({data:'metodo put'});
        });

        app.delete('/',(req, res, next)=>{
            res
                .status(200)
                .json({data:'metodo delete'});
        });

        _server = app.listen('9000',()=>{
            if(process.env.NODE_ENV !== 'test' ){
                console.log('servidor init 9000')
            }
        })
    },
    close(){
        _server.close();
    }
};

export default server;

if(!module.parent){
    server.start()
}