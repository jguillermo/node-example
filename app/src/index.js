import express from 'express'

const app = express()

app.get('/',(req,res)=>{
    res.end('Hola mundo')
})

app.listen('9000',()=>{
    console.log('servidio init')
})