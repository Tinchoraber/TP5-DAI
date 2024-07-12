import { Router } from 'express';
import ValidacionesHelper from '../helpers/validaciones-helper.js';
import eventService from '../services/event-service.js';
import jwt from 'jsonwebtoken';
const router = Router();
const svc = new eventService();
const verifyToken = (req, res, next) => {
    const secretKey = 'ClaveSuperSecreta2006$';
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    if (!token) {
      return res.status(403).json({ message: 'Token requerido' });
    }
    jwt.verify(token, secretKey, (err, decoded) => {
      if (err) {
        return res.status(401).send('Unauthorized');
      }
      req.user = decoded;
      next();
    });
  }
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
  //5)
  router.get('/:id/enrollment', async (req, res) => {
    const id = req.params.id;
    const firstName = req.query.first_name;
    const lastName = req.query.last_name;
    const username = req.query.username;
    const attended = req.query.attended;
    const rating = req.query.rating;
    const result = await svc.getEnrollments(id, firstName, lastName, username, attended, rating);
    if (result) {
        res.status(200).send(result);
    }
    else {
        res.status(404).send('No se encontraron inscripciones que cumplan con los criterios de búsqueda');
    }
});
  //8)
  router.post('', verifyToken, async (req, res) => {
    const body = req.body;
    const returnArray = await svc.insertEventAsync(body);
    res.status(returnArray[1]).json(returnArray[0]);
  });

  router.put('', verifyToken, async (req, res) => {
    const body = req.body;
    const returnArray = await svc.updateEventAsync(body);
    res.status(returnArray[1]).json(returnArray[0]);
  });

  router.delete('/:id', verifyToken, async (req, res) => {
    const id = req.params.id;
    const returnArray = await svc.deleteEventAsync(id);
    res.status(returnArray[1]).json(returnArray[0]);
  });

  //9)
  router.post('/:id/enrollment/', verifyToken, async (req, res) => {
    const id = req.params.id;
    const header = req.header;
    const returnArray = await svc.insertEventEnrollmentsAsync(id, header);
      res.status(returnArray[1]).json(returnArray[0]);
    });
export default router;