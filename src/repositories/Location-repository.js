import config from '../configs/db-configs.js';
import pkg from 'pg';
import validacionesHelper from '../helpers/validaciones-helper.js';
const { Client, Pool } = pkg;

export default class LocationRepository{
    getAllLocationsAsync = async () => {
        const client = new Client(config);
        await client.connect();
        const sql = `SELECT * FROM locations`;
        let locations = await client.query(sql);
        await client.end();
        if(locations.rowCount == 0){
            return ['BAD REQUEST', 400];
        }
        else{
            return [locations, 200];
        }
}

getAllLocationsByIdAsync = async (id) => {
    const client = new Client(config);
    await client.connect();
    const sql = `SELECT * FROM locations WHERE id = $1`;
    const values = [id]
    let locations = await client.query(sql, values);
    await client.end();
    if(locations.rowCount == 0){
        return ['NOT FOUND', 404];
    }
    else{
        return [locations, 200];
    }
}

getByIdEventLocationsLocationsAsync = async (id) => {
    const client = new Client(config);
    await client.connect();
    const sql = `SELECT * FROM event_locations el INNER JOIN locations l ON el.id_location = l.id  WHERE l.id = $1`;
    const values = [id]
    let event_locations = await client.query(sql, values);
    await client.end();
    if(event_locations.rowCount == 0){
        return ['NOT FOUND', 404];
    }
    else{
        return [event_locations, 200];
    }
}


}