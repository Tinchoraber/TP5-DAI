import config from '../configs/db-configs.js';
import pkg from 'pg';
const { Client, Pool } = pkg;

export default class ProvinceRepository {
    getAllAsync = async () => {
        const client = new Client(config);
        await client.connect();
        let sql = `SELECT * FROM provinces`;
        let provinces = await client.query(sql);
        console.log(provinces)
        await client.end();
        return provinces;
    }

    getByIdAsync = async (id) => {
        const client = new Client(config);
        await client.connect();
        let sql = `SELECT * FROM provinces WHERE id=$1`;
        const values = [id];
        const result = await client.query(sql, values);
        await client.end();
        return result;
    }

    createAsync = async (body) => {
        try {
            const client = new Client(config);
            await client.connect();
            const sql = `INSERT INTO provinces 
                            (name, full_name, latitude. longitude, display_order)
                         VALUES
                         ($1, $2, $3, $4, $5)`;
            let nombre = ValidacionesHelper.getStringorDefault(body.name);
            let full_nombre = ValidacionesHelper.getStringorDefault(body.full_name);
            let latitud = ValidacionesHelper.getIntegerorDefault(body.latitude);
            let longitud = ValidacionesHelper.getIntegerorDefault(body.longitude);
            let display_orden = ValidacionesHelper.getIntegerorDefault(body.display_order);
            provinces.push({
                id: (provinces.length + 1),
                name: nombre,
                full_name: full_nombre,
                latitude: latitud,
                longitude: longitud,
                display_order: display_orden
            });
            return ["Created", 201];
        }
        catch (error) {
            return [error, 404]
        }

        
        
        
        const values = [id];
        const result = await client.query(sql, values);
        await client.end();
        return result;
    }

    updateAsync = async (body) => {
        let arrayRes = "";
        const crUpdateAsync = ValidacionesHelper.getIntegerorDefault(body.id)
        const index = provinces.findIndex(province => province.id === entity.id);
        if (index != -1) {
            if (body.name == "" || body.name.length <= 3) {
                arrayRes = ["Error, no cumple las condiciones", 400]
            }
            else {
                arrayRes = ["Created", 201];
                provinces[body.id - 1] =
                {
                    id: body.id,
                    name: body.name,
                    full_name: body.full_name,
                    latitude: body.latitude,
                    longitude: body.longitude,
                    display_order: body.display_order
                }
            }
        } else {
            arrayRes = ["No se encontro la provincia", 404]
        }
        return arrayRes;
    }

    deleteByIdAsync = async (id) => {
        const index = provinces.findIndex(province => province.id === id);
        let arrayRes;
        if (index !== -1) {
            provinces.splice(index, 1);
            arrayRes = ["Se pudo eliminar la provincia correctamente", 200]
        } else {
            arrayRes = ["No se encontro la provincia", 404]
        }
        return arrayRes;
    }
}