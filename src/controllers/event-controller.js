import { Router } from 'express';
import ValidacionesHelper from '../helpers/validaciones-helper.js';
import eventService from '../services/event-service.js';

const router = Router();
const svc = new eventService();
   //2
   router.get('', async (req, res) => {
      try {
         console.log('entro')
         const returnArray = await svc.getAllEventsAsync();
         console.log(returnArray)
         res.status(200).json(returnArray[0]);
     } catch (error) {
      console.log('entro5')
         res.status(500).send('Error interno.');
     }
    });

    //3
    router.get('', async (req, res) => {
        
        res.status(200).send('OK')
     });
     //4)
     router.get('/api/event/{id}', async (req, res) => {
        
        res.status(200).send('OK')
     });




export default router;