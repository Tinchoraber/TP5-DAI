import config from "../configs/db-configs.js";
import pkg from "pg";
const { Client, Pool } = pkg;

export default class eventRepository {
  getAllEventsAsync = async () => {
    const client = new Client(config);
    await client.connect();
    const sql = `SELECT E.id, e.name, e.description, json_build_object(
        'id', EC.id, 
        name, EC.name, 
    ) AS event_category EC, 
    json_build_object(
        'id', EL.id, 
        name, EL.name, 
        full_adress, EL.full_adress,
        latitude, EL.latitude,
        longitude, EL.longitude,
        max_capacity, EL.max_capacity,
        json_build_object(
            'id', L.id, 
            name, L.name, 
            latitude, L.latitude,
            longitude, L.longitude,
            max_capacity, L.max_capacity,
            json_build_object(
                'id', P.id, 
                name, P.name, 
                full_name, P.full_name,
                latitude, P.latitude,
                longitude, P.longitude,
                display_order, P.display_order
                ) AS province P
            ) AS location L 
    ) AS event_location EL, 
    E.start_date, E.duration_in_minutes, E.price, E.enabled_for_enrollment, E.max_assistance, 
    json_build_object(
        'id', U.id, 
        username, U.username, 
        first_name, U.first_name,
        last_name, U.last_name
    ) AS users U, 
    json_build_object(
        'id', T.id, 
        name, T.name
    ) AS tags T 
     FROM events E 
    INNER JOIN event_category EC ON E.id_event_category = EC.id
    INNER JOIN event_location EL ON E.id_event_location = EL.id
    INNER JOIN location L ON EL.id_location = L.id
    INNER JOIN province P ON L.id_province = P.id
    INNER JOIN users U ON E.id_creator_user = U.id
    INNER JOIN event_tags ET ON E.id  = ET.id_event
    INNER JOIN tags T ON ET.id_tag = T.id
    GROUP BY E.id, EL.id, EC.id, L.id, P.id, U.id, ET.id, T.id`;
    let events = await client.query(sql);
    console.log(events);
    await client.end();
    return events;
  };
}
