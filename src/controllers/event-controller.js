import { Router } from 'express';
import ValidacionesHelper from '../helpers/validaciones-helper.js';
import eventService from '../services/event-service.js';
import jwt from 'jsonwebtoken';
const router = Router();
const svc = new eventService();
  const verifyToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    
    if (token == null) {
      console.log('No token provided');
      return res.sendStatus(401); // No token provided
    }
    
    const secretKey = process.env.ACCESS_TOKEN_SECRET || 'ClaveSuperSecreta2006$';
    jwt.verify(token, secretKey, (err, user) => {
      if (err) {
        console.log('Token verification failed', err);
        return res.sendStatus(403); // Invalid token
      }
      
      console.log('Token verified successfully', user);
      req.user = user; // Store user information in request
      next();
    });
  };
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
  router.post('/:id/enrollment', verifyToken, async (req, res) => {
    const id = req.params.id;
    const getId = svc.getEventsByIdAsync(id);
    if (!getId) {
        res.status(404).send('Evento no encontrado');
        return;
    }
    const result = await svc.insertEventEnrollmentsAsync(id, req.user.id);
    if (result) {
        res.status(201).send();
    }
    else {
        res.status(400).send('Ya no hay cupos disponibles');
    }
})

router.delete('/:id/enrollment', verifyToken, async (req, res) => {
    const id = req.params.id;
    const result = await svc.deleteEventEnrollmentAsync(id, req.user.id);
    if (result == 200) {
        res.status(200).send();
    }
    else if (result == 404) {
        res.status(404).send('Inscripción o evento no encontrado');
    }
    else {
        res.status(400).send('El evento ya ha pasado');
    }
});
//10)
router.patch('/:id/enrollment/:rating', verifyToken, async (req, res) => {
    const id = req.params.id;
    const getId = svc.getEventsByIdAsync(id);
    if (!getId) {
        res.status(404).send('Evento no encontrado');
        return;
    }
    const rating = ValidacionesHelper.getIntegerOrDefault(req.params.rating);
    if (rating < 1 || rating > 10) {
        res.status(400).send('La calificación debe ser un número entero entre 1 y 10');
        return;
    }
    const result = await svc.valorarEventEnrollmentAsync(id, req.user.id, rating);
    if (result) {
        res.status(200).send();
    }
    else {
        res.status(400).send('Error en las reglas del negocio');
    }
});

export default router;