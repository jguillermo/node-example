"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express = require("express");
const logger = require("morgan");
const app = express();
app.disable('X-Powered-By');
app.use(logger("combined"));
app.get('/', (req, res) => {
    res.end('hola mundo');
});
app.listen('9000', () => {
    console.log('servidor en el 9000');
});
//# sourceMappingURL=server.js.map