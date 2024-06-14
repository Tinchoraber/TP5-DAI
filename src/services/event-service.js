import eventRepository from "../repositories/event-repository.js";

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
}