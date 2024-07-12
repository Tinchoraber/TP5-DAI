import { Router } from 'express';
import ValidacionesHelper from '../helpers/validaciones-helper.js';
import eventService from '../services/event-service.js';

const router = Router();
const svc = new eventService();
   //2
   router.get('', async (req, res) => {
      try {
         const returnArray = await svc.getAllEventsAsync();
         console.log(returnArray)
         res.status(200).json(returnArray[0]);
     } catch (error) {
         res.status(500).send('Error interno.');
     }
    });

    //3
    router.get('/', async (req, res) => {
        let result;
        if (req.query === undefined || Object.keys(req.query).length === 0) {
            result = await eventService.getAllEvents();
        }
        else {
            const name = getString(req.query.name);
            const category = getString(req.query.category);
            const startDate = getDate(req.query.start_date);
            const tag = getString(req.query.tag);
            result = await eventService.getFilteredEvent(name, category, startDate, tag);
            if (!result) {
                res.status(404).send('No se encontraron eventos que cumplan con los criterios de búsqueda');
                return;
            }
        }
        if (result) {
            res.status(200).send(result);
        }
        else {
            res.status(500).send('Error interno');
        }
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