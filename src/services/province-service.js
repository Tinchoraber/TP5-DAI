import ProvinceRepository from '../repositories/province-repository.js';

export default class ProvinceService {
    // Clase con lógica de negocio.

    getAllAsync = async () => {
        const repo = new ProvinceRepository();
        const arrayProvincias = await repo.getAllAsync();
        console.log(arrayProvincias)
        let arrayRes;
        if (arrayProvincias.length < 0) {
            arrayRes = ["No hay provincias", 404];
        }
        else {
            arrayRes = [arrayProvincias, 200];
            
        }
        return arrayRes;
    }

    getByIdAsync = async (id) => {
        const repo = new ProvinceRepository();
        const provinciaEncontrada = await repo.getByIdAsync(id);
        console.log(provinciaEncontrada)
        let arrayRes;
        if (provinciaEncontrada.name != '') {
            arrayRes = [provinciaEncontrada, 200];
        }
        else {
            arrayRes = ["No se encuentra la provincia", 404];
        }
        return arrayRes;
    }

    createAsync = async (body) => {
        const repo = new ProvinceRepository();
        let arrayRes = await repo.createAsync(body);
        return arrayRes;
    }

    updateAsync = async (entity) => {
        const repo = new ProvinceRepository();
        let arrayRes = await repo.updateAsync(entity);
        return arrayRes;
    }

    deleteByIdAsync = async (id) => {
        const repo = new ProvinceRepository();
        let arrayRes = await repo.deleteByIdAsync(id);
        return arrayRes;
    }
}

