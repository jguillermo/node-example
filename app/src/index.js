import express from 'express'
import morgan from 'morgan'
import bodyParse from 'body-parser'

const app = express()
app.disable('X-Powered-By')

app.use(morgan('combined'))
app.use(bodyParse.json())
app.use(bodyParse.urlencoded({extended:false}))

app.get('/',(req,res)=>{
    res.end('Hola mundo')
})

app.listen('9000',()=>{
    console.log('servidio init')
})