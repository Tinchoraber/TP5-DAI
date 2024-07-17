import EventLocationRepository from "../repositories/eventLocation-repository.js";
export default class EventLocationService {
    // Clase con lógica de negocio.
    getAllEventsLocationsAsync = async () => {
        const repo = new EventLocationRepository();
        let arrayRes = await repo.getAllEventsLocationsAsync();
        return arrayRes;
    }

    getAllEventsLocationsByIdAsync = async (id) => {
        const repo = new EventLocationRepository();
        let arrayRes = await repo.getAllEventsLocationsByIdAsync(id);
        return arrayRes;
    }

    insertEventsLocationsAsync = async (body) => {
        const repo = new EventLocationRepository();
        let arrayRes = await repo.insertEventsLocationsAsync(body);
        return arrayRes;
    }

    updateEventsLocationsAsync = async (body) => {
        const repo = new EventLocationRepository();
        let arrayRes = await repo.updateEventsLocationsAsync(body);
        return arrayRes;
    }

    deleteEventsLocationsByIdAsync = async (id) => {
        const repo = new EventLocationRepository();
        let arrayRes = await repo.deleteEventsLocationsByIdAsync(id);
        return arrayRes;
    }
    
}