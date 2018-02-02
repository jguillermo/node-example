import * as express from 'express'

const router = express.Router()

router
    .get('/',(req, res, next)=>{
        res
        .status(200)
        .json({data:'metodo get de home'});
    })
    .post('/',(req, res, next)=>{
        console.log('body response',req.body)
        res
        .status(201)
        .json({data:'metodo post'});
    })

router.get('/:singer',(req, res, next)=>{

})

export default router;