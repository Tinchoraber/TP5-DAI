import eventCategoryRepository from '../repositories/eventCategory-repository.js';
export default class eventService{
    getAllEventCategoriesAsync = async () => {
        const repo = new eventCategoryRepository();
        let arrayRes = await repo.getAllEventCategoriesAsync();
        return arrayRes;
    }

    getAllEventCategoriesByIdAsync = async (id) => {
        const repo = new eventCategoryRepository();
        let arrayRes = await repo.getAllEventCategoriesByIdAsync(id);
        return arrayRes;
    }
    insertEventCategoriesAsync = async (body) => {
        const repo = new eventCategoryRepository();
        let arrayRes = await repo.insertEventCategoriesAsync(body);
        return arrayRes;
    }
    updateEventCategoriesAsync = async (body) => {
        const repo = new eventCategoryRepository();
        let arrayRes = await repo.updateEventCategoriesAsync(body);
        return arrayRes;
    }
    deleteEventCategoriesAsync = async (id) => {
        const repo = new eventCategoryRepository();
        let arrayRes = await repo.deleteEventCategoriesAsync(id);
        return arrayRes;
    }

}