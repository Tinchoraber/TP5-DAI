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
    
}