import * as express from 'express'

import * as config from './config'
import * as router from './router'

let _server;

// console.log(config.default);

const server = {
    start(){
        const app = express()

        config.default(app)
        router.default(app)


        _server = app.listen('9000',()=>{
            console.log('servidor en el 9000')
        })
    },
    close(){
        _server.close()
    }
};

export default server

if(!module.parent){
    server.start();
}