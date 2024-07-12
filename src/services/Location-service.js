import LocationRepository from "../repositories/Location-repository.js";
export default class EventLocationService{
    // Clase con lógica de negocio.

    getAllLocationsAsync = async () => {
        const repo = new LocationRepository();
        let arrayRes = await repo.getAllLocationsAsync();
        return arrayRes;
    }

    getAllLocationsByIdAsync = async (id) => {
        const repo = new LocationRepository();
        let arrayRes = await repo.getAllLocationsByIdAsync(id);
        return arrayRes;
    }

    getByIdEventLocationsLocationsAsync = async (id) => {
        const repo = new LocationRepository();
        let arrayRes = await repo.getByIdEventLocationsLocationsAsync(id);
        return arrayRes;
    }
}