import eventRepository from "../repositories/event-repository.js";
import { Pagination } from "../common/Pagination.js";
export default class eventService{
    getAllEventsAsync = async () =>{
        const repo = new eventRepository();
        const arrayEventos = await repo.getAllEventsAsync();
        console.log(arrayEventos)
        let arrayRes;
        if (arrayEventos.length < 0) {
            arrayRes = ['No hay eventos', 404];
        }
        else {
            arrayRes = [arrayEventos, 200];
            
        }
        return arrayRes;
    }
    searchEventsAynsc = async (limit, offset, path, eventName, eventCategory, eventDate, eventTag) =>{
          
        const parsedLimit = this.pagination.parseLimit(limit);
        const parsedOffset = this.pagination.parseOffset(offset);
        
        const [events, totalCount] = await this.eventRepository.searchEventsAynsc(
        parsedLimit,
        parsedOffset,
        eventName,
        eventCategory,
        eventDate,
        eventTag,
        );
        
        const response = {
        collection: events,
        pagination: this.pagination.buildPaginationDto(parsedLimit, parsedOffset, totalCount, path),
        };
        
        return response;
        }
    getEventsByIdAsync = async(id) =>{
        const repo = new eventRepository();
        try {
            const eventoEncontrado = await repo.getEventsByIdAsync(id);
            let arrayRes;
            if (eventoEncontrado.rows.length > 0) {
                arrayRes = [eventoEncontrado.rows[0], 200];
            } else {
                arrayRes = ['No se encuentra el evento', 404];
            }
            return arrayRes;
        } catch (error) {
            console.error('Error en servicio:', error);
            throw error;
        }
    }
    getEnrollments(id, firstName, lastName, username, attended, rating) {
        return this.repo.getEnrollments(id, firstName, lastName, username, attended, rating);
    }
    insertEventAsync = async (body) => {
        const repo = new eventRepository();
        let arrayRes = await repo.insertEventsAsync(body);
        return arrayRes;
    }
    updateEventAsync = async (body) => {
        const repo = new eventRepository();
        let arrayRes = await repo.updateEventsAsync(body);
        return arrayRes;
    }
    deleteEventAsync = async (id) => {
        const repo = new eventRepository();
        let arrayRes = await repo.deleteEventAsync(id);
        return arrayRes;
    }

    insertEventEnrollmentsAsync = async (id, body) => {
        const repo = new eventEnrollmentRepository();
        let arrayRes = await repo.insertEventEnrollmentsAsync(id, body);
        return arrayRes;
    }
}