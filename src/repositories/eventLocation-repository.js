import config from '../configs/db-configs.js';
import pkg from 'pg';
import validacionesHelper from '../helpers/validaciones-helper.js';
const { Client, Pool } = pkg;

export default class EventLocationRepository {
    getAllEventsLocationsAsync = async () => {
        const client = new Client(config);
        await client.connect();
        const sql = `SELECT * FROM event_locations`;
        let locations = await client.query(sql);
        await client.end();
        if(locations.rowCount == 0){
            return ['BAD REQUEST', 400];
        }
        else{
            return [locations, 200];
        }
}

getAllEventsLocationsByIdAsync = async (id) => {
    const client = new Client(config);
    await client.connect();
    const sql = `SELECT * FROM event_locations WHERE id = $1`;
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

insertEventsLocationsAsync = async (body) => {
    const client = new Client(config);
    await client.connect();
    const checkSql = `SELECT 1 FROM event_locations WHERE id_location = $1`;
    const checkValues = [body.id_location];
    let existingLocation = await client.query(checkSql, checkValues);
    const sql = `INSERT INTO event_locations(id_location, name, full_adress, max_capacity, latitude, longitude)
    VALUES($1, $2, $3, $4, $5, $6)`;
    let id_location = body.id_location;
    let name = body.name;
    let full_adress = body.full_adress;
    let maxima_capacidad = body.max_capacity;
    let latitud = body.latitude;
    let longitud = body.longitude;
    const values = [id_location, name, full_adress, maxima_capacidad, latitud, longitud]
    let event_locations = await client.query(sql, values);
    await client.end();
    if(name < 3){
        return ['BAD REQUEST', 400];
    }
    else if(maxima_capacidad < 0){
        return ['BAD REQUEST', 400];
    }
    else if(existingLocation.rowCount == 0){
        return ['BAD REQUEST', 400];
    }
    else{
        return [event_locations, 200];
    }
}

updateEventsLocationsAsync = async (body) => {
    const client = new Client(config);
    await client.connect();
    const checkSql = `SELECT 1 FROM event_locations WHERE id_location = $1`;
    const checkValues = [body.id_location];
    let existingLocation = await client.query(checkSql, checkValues);
    const sql = `UPDATE event_locations 
    SET id_location = $1, name = $2, full_adress = $3, max_capacity = $4, latitude = $5, longitude = $6 WHERE id = $7`;
    let id = body.id;
    let id_location = body.id_location;
    let name = body.name;
    let full_adress = body.full_adress;
    let maxima_capacidad = body.max_capacity;
    let latitud = body.latitude;
    let longitud = body.longitude;
    const values = [id, id_location, name, full_adress, maxima_capacidad, latitud, longitud]
    let event_locations = await client.query(sql, values);
    await client.end();
    if(name < 3){
        return ['BAD REQUEST', 400];
    }
    else if(maxima_capacidad < 0){
        return ['BAD REQUEST', 400];
    }
    else if(existingLocation.rowCount == 0){
        return ['BAD REQUEST', 400];
    }
    else if(event_locations.rowCount == 0){
        return ['NOT FOUND', 404];
    }
    else{
        return [event_locations, 200];
    }
}

deleteEventsLocationsByIdAsync = async (id) => {
    const client = new Client(config);
    await client.connect();
    const sql = `DELETE FROM event_locations WHERE id = $1`;
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