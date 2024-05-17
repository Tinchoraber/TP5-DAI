import { Router } from 'express';
import ValidacionesHelper from '../helpers/validaciones-helper.js';

const router = Router();
const svc = new ProvinceService();
function eventController() {
    //2)
    router.get('/api/event', async (req, res) => {

       res.status(200).send('OK')
    });
    //3)
    router.get('/api/event/', async (req, res) => {
        
        res.status(200).send('OK')
     });
     //4)
     router.get('/api/event/{id}', async (req, res) => {
        
        res.status(200).send('OK')
     });

}


export default eventController;