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

  router.get('/:id/enrollment', async (req, res) => {
    const id = getInteger(req.params.id);
    if (id === null) {
        res.status(400).send('El id de evento debe ser un número entero');
        return;
    }
    const firstName = getString(req.query.first_name);
    const lastName = getString(req.query.last_name);
    const username = getString(req.query.username);
    const attended = getBoolean(req.query.attended);
    const rating = getInteger(req.query.rating);
    const result = await eventService.getEnrollments(id, firstName, lastName, username, attended, rating);
    if (result) {
        res.status(200).send(result);
    }
    else {
        res.status(404).send('No se encontraron inscripciones que cumplan con los criterios de búsqueda');
    }
});

router.post('/', verifyToken, async (req, res) => {
    const result = await eventService.createAsync(req.body, req.user.id);
    if (result) {
        res.status(201).send();
    }
    else {
        res.status(500).send('Error en las reglas del negocio');
    }
});

router.put('/', verifyToken, async (req, res) => {
    const result = await eventService.updateAsync(req.body, req.user.id);
    if (result) {
        res.status(200).send();
    }
    else {
        res.status(400).send('Error en las reglas del negocio');
    }
});

router.delete('/:id', verifyToken, async (req, res) => {
    const id = getInteger(req.params.id);
    if (id === null) {
        res.status(400).send('El id de evento debe ser un número entero');
        return;
    }
    const result = await eventService.deleteAsync(id, req.user.id);
    if (result) {
        res.status(200).send();
    }
    else {
        res.status(400).send('Error en las reglas del negocio');
    }
});

router.post('/:id/enrollment', verifyToken, async (req, res) => {
    const id = getInteger(req.params.id);
    if (id === null) {
        res.status(400).send('El id de evento debe ser un número entero');
        return;
    }
    const getId = eventService.getById(id);
    if (!getId) {
        res.status(404).send('Evento no encontrado');
        return;
    }
    const result = await eventService.enrollAsync(id, req.user.id);
    if (result) {
        res.status(201).send();
    }
    else {
        res.status(400).send('Ya no hay cupos disponibles');
    }
})

router.delete('/:id/enrollment', verifyToken, async (req, res) => {
    const id = getInteger(req.params.id);
    if (id === null) {
        res.status(400).send('El id de evento debe ser un número entero');
        return;
    }
    const result = await eventService.unenrollAsync(id, req.user.id);
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

router.patch('/:id/enrollment/:rating', verifyToken, async (req, res) => {
    const id = getInteger(req.params.id);
    if (id === null) {
        res.status(400).send('El id de evento debe ser un número entero');
        return;
    }
    const getId = eventService.getById(id);
    if (!getId) {
        res.status(404).send('Evento no encontrado');
        return;
    }
    const rating = getInteger(req.params.rating);
    if (rating < 1 || rating > 10) {
        res.status(400).send('La calificación debe ser un número entero entre 1 y 10');
        return;
    }
    const result = await eventService.rateAsync(id, req.user.id, rating);
    if (result) {
        res.status(200).send();
    }
    else {
        res.status(400).send('Error en las reglas del negocio');
    }
});



export default router;