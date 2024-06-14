import config from '../configs/db-configs.js';
import pkg from 'pg';
import validacionesHelper from '../helpers/validaciones-helper.js';
const { Client, Pool } = pkg;

export default class ProvinceRepository {
    getAllAsync = async () => {
        const client = new Client(config);
        await client.connect();
        const sql = `SELECT * FROM provinces`;
        let provinces = await client.query(sql);
        console.log(provinces)
        await client.end();
        return provinces;
    }

    getByIdAsync = async (id) => {
        const client = new Client(config);
        await client.connect();
        const sql = `SELECT * FROM provinces WHERE id=$1`;
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
                            (name, full_name, latitude, longitude, display_order)
                         VALUES
                         ($1, $2, $3, $4, $5)`;
            let nombre = validacionesHelper.getStringOrDefault(body.name);
            let full_nombre = validacionesHelper.getStringOrDefault(body.full_name);
            let latitud = validacionesHelper.getIntegerOrDefault(body.latitude);
            let longitud = validacionesHelper.getIntegerOrDefault(body.longitude);
            let display_orden = validacionesHelper.getIntegerOrDefault(body.display_order);
            const values = [nombre, full_nombre, latitud, longitud, display_orden];
            const result = await client.query(sql, values);
            await client.end();
            return ['Created', 201];
        }
        catch (error) {
            return [error, 404]
        }

        
        
        
       
    }

    updateAsync = async (body) => {
            const client = new Client(config);
            await client.connect();
            const sql1 = `SELECT * FROM provinces WHERE id = $1`;
            const values1 = [body.id];
            let resultado1 = await client.query(sql1, values1);
            const sql = `UPDATE provinces
                        SET name = $1, 
                        full_name = $2, 
                        latitude = $3, 
                        longitude = $4, 
                        display_order = $5
                        WHERE id = $6`;
            let nombre = validacionesHelper.getStringOrDefault(body.name);
            let full_nombre = validacionesHelper.getStringOrDefault(body.full_name);
            let latitud = validacionesHelper.getIntegerOrDefault(body.latitude);
            let longitud = validacionesHelper.getIntegerOrDefault(body.longitude);
            let display_orden = validacionesHelper.getIntegerOrDefault(body.display_order);
            const values = [nombre, full_nombre, latitud, longitud, display_orden, body.id];
            const result = await client.query(sql, values); 
            await client.end();
             if (resultado1 < 1) {
                return ['Not Found', 404];
            }
            else if(!body.name || body.name.length < 3){
                return ['Bad Request: Nombre inválido', 400]
            }
            else{
                return ['OK', 200]
            }
    }

    deleteByIdAsync = async (id) => {
        const client = new Client(config);
        await client.connect();
        const sql = `DELETE FROM Provinces WHERE id = $1`;
        const values = [id];
        let provinciaEliminada = await client.query(sql, values)
        if (provinciaEliminada < 1) {
           return ["No se encontro la provincia", 404] 
        } else {
            return ['OK', 200]
        }
    }
}