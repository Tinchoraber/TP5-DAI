import config from "../configs/db-configs.js";
import pkg from "pg";
const { Client, Pool } = pkg;

export default class eventCategoryRepository {
    getAllEventCategoriesAsync = async () => {
        const client = new Client(config);
        await client.connect();
        const sql = `SELECT * FROM event_categories`;
        let event_categories = await client.query(sql);
        await client.end();
        if(event_categories.rowCount == 0){
            return ['BAD REQUEST', 400];
        }
        else{
            return [event_categories, 200];
        }
        
}

getAllEventCategoriesByIdAsync = async (id) => {
    const client = new Client(config);
    await client.connect();
    const sql = `SELECT * FROM event_categories WHERE id = $1`;
    const values = [id]
    let event_categories = await client.query(sql, values);
    await client.end();
    if(event_categories.rowCount == 0){
        return ['NOT FOUND', 404];
    }
    else{
        return [event_categories, 200];
    }
}

insertEventCategoriesAsync = async (body) => {
    const client = new Client(config);
    await client.connect();
    const sql = `INSERT INTO event_categories(name, display_order)
    VALUES($1, $2)`;
    let name = body.name;
    let display_order = body.display_order
    const values = [name, display_order]
    let event_categories = await client.query(sql, values);
    await client.end();
    if(name < 3){
        return ['BAD REQUEST', 400];
    }
    else{
        return [event_categories, 200];
    }
}

updateEventCategoriesAsync = async (body) => {
    const client = new Client(config);
    await client.connect();
    const sql = `UPDATE event_categories
    SET name = $1, display_order = $2 WHERE id = $3`;
    let name = body.name;
    let display_order = body.display_order;
    let id = body.id;
    const values = [name, display_order, id]
    let event_categories = await client.query(sql, values);
    await client.end();
    if(name < 3){
        return ['BAD REQUEST', 400];
    }
    else if(event_categories.rowCount == 0)
    {
        return ['NOT FOUND', 404];
    }
    else{
        return [event_categories, 200];
    }
}

deleteEventCategoriesAsync = async (id) => {
    const client = new Client(config);
    await client.connect();
    const sql = `DELETE FROM event_categories WHERE id = $1`;
    const values = [id]
    let event_categories = await client.query(sql, values);
    await client.end();
    if(event_categories.rowCount == 0)
    {
        return ['NOT FOUND', 404];
    }
    else{
        return [event_categories, 200];
    }
}
}