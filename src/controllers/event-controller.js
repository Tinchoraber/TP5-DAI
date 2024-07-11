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
    router.get('/', async (req, res, next) => {
      const { offset, limit, name, category, startDate, tag } = req.query;
      const url = req.originalUrl;
      
      eventService
      .searchEventsAynsc(limit, offset, url, name, category, startDate, tag)
      .then(user => res.status(200).json(user))
      .catch(err => next(err));
      });
     //4)   
     router.get('/:id', async (req, res) => {
      const id = req.params.id; // Obtener el ID del parámetro de la URL
      try {
          const eventoEncontrado = await svc.getEventsByIdAsync(id);
          res.status(eventoEncontrado[1]).json(eventoEncontrado[0]);
      } catch (error) {
          res.status(500).send('Error interno.');
      }
  });




export default router;