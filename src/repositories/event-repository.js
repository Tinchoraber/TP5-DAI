import config from "../configs/db-configs.js";
import pkg from "pg";
const { Client, Pool } = pkg;

export default class eventRepository {
  getAllEventsAsync = async () => {
    const client = new Client(config);
    await client.connect();
    const sql = `SELECT e.id, e.name, e.description, e.start_date, e.duration_in_minutes, e.price, e.enabled_for_enrollment, e.max_assistance, 
    json_build_object(
        'id', el.id, 
        'name', el.name, 
        'full_address', el.full_adress, 
        'latitude', el.latitude, 
        'longitude', el.longitude, 
        'max_capacity', el.max_capacity,
        'location', json_build_object(
            'id', l.id, 
            'name', l.name, 
            'latitude', l.latitude, 
            'longitude', l.longitude,
            'province', json_build_object(
                'id', p.id, 
                'name', p.name, 
                'full_name', p.full_name, 
                'latitude', p.latitude, 
                'longitude', p.longitude
            )
        )
    ) AS event_location,
    json_build_object(
        'id', u.id, 
        'first_name', u.first_name, 
        'last_name', u.last_name, 
        'username', u.username
    ) AS creator_user,
    json_agg(json_build_object('id', t.id, 'name', t.name)) AS tags
    FROM events e
    INNER JOIN event_locations el ON e.id_event_location = el.id
    INNER JOIN locations l ON el.id_location = l.id
    INNER JOIN provinces p ON l.id_province = p.id
    INNER JOIN users u ON e.id_creator_user = u.id
    INNER JOIN event_tags et ON e.id = et.id_event
    INNER JOIN tags t ON et.id_tag = t.id
    GROUP BY e.id, el.id, l.id, p.id, u.id;`;
    let events = await client.query(sql);
    console.log(events);
    await client.end();
    return events;
  };
   searchEventAsync = async(limit, offset, eventName, eventCategory, eventDate, eventTag) =>{
    let returnArray = null;
    let countElements = -1;
    const whereClause = [];
    const values = [limit, offset];
    let paramCount = 3;
    
    if (eventName) whereClause.push(`e.name LIKE $${paramCount}`) && values.push(`%${eventName}%`) && paramCount++;
    if (eventCategory) whereClause.push(`ec.name = $${paramCount}`) && values.push(eventCategory) && paramCount++;
    if (eventDate) whereClause.push(`e.start_date >= $${paramCount}`) && values.push(eventDate) && paramCount++;
    if (eventTag) whereClause.push(`t.name = $${paramCount}`) && values.push(eventTag) && paramCount++;
    try {
        let sql = `SELECT e.id,
        e.name,
        e.description,
        e.start_date,
        e.duration_in_minutes,
        e.price,
        e.enabled_for_enrollment,
        e.max_assistance,
        array(select name from tags t2 left join event_tags et2 on t2.id = et2.id_tag where et2.id_event = e.id ) AS tags,
        json_build_object(
        'id', u.id,
        'username', u.username,
        'first_name', u.first_name,
        'last_name', u.last_name
        ) AS creator_user,
        json_build_object(
        'id', ec.id,
        'name', ec.name
        ) AS event_category,
        json_build_object(
        'id', el.id,   
        'name', el.name,
        'full_address', el.full_address,
        'latitude', el.latitude,
        'longitude', el.longitude,
        'max_capacity', el.max_capacity
        ) AS event_location
        FROM events e
        LEFT JOIN users u ON e.id_creator_user = u.id
        LEFT JOIN event_categories ec ON e.id_event_category = ec.id
        LEFT JOIN event_locations el ON e.id_event_location = el.id
        LEFT JOIN event_tags et ON e.id = et.id_event
        LEFT JOIN tags t ON et.id_tag = t.id
        ${whereClause.length > 0 ? `WHERE ${whereClause.join(' AND ')}` : ''}
        GROUP BY e.id, u.id, ec.id, el.id, t.id
        ORDER BY e.start_date, e.name
        OFFSET $2
        LIMIT $1`;
        const result = await this.DBClient.query(sql, values);
   }
    catch (error) {
    console.log(error);
    }
    returnArray = result.rows;
    countElements = countElements.rows?.[0]?.totalrecords ?? 0;
    return [returnArray, countElements];
    }

    getEventsByIdAsync = async(id) =>{
        const client = new Client(config);
            try {
                await client.connect();
                const sql = `
                    SELECT e.id,
                        e.name,
                        e.description,
                        e.start_date,
                        e.duration_in_minutes,
                        e.price,
                        e.enabled_for_enrollment,
                        e.max_assistance,
                        array(select name from tags t2 left join event_tags et2 on t2.id = et2.id_tag where et2.id_event = e.id ) AS tags,
                        json_build_object(
                            'id', u.id,
                            'username', u.username,
                            'first_name', u.first_name,
                            'last_name', u.last_name
                        ) AS creator_user,
                        json_build_object(
                            'id', el.id,
                            'id_location', el.id_location, 
                            'name', el.name, 
                            'full_address', el.full_adress,
                            'max_capacity', el.max_capacity, 
                            'latitude', el.latitude, 
                            'longitude', el.longitude, 
                            'location', json_build_object(
                                'id', l.id, 
                                'name', l.name, 
                                'latitude', l.latitude, 
                                'longitude', l.longitude,
                                'province', json_build_object(
                                    'id', p.id, 
                                    'name', p.name, 
                                    'full_name', p.full_name, 
                                    'latitude', p.latitude, 
                                    'longitude', p.longitude
                                )
                            )
                        ) AS event_location
                    FROM events e
                    INNER JOIN event_locations el ON e.id_event_location = el.id
                    INNER JOIN locations l ON el.id_location = l.id
                    INNER JOIN provinces p ON l.id_province = p.id
                    INNER JOIN users u ON e.id_creator_user = u.id
                    LEFT JOIN event_tags et ON e.id = et.id_event
                    LEFT JOIN tags t ON et.id_tag = t.id
                    WHERE e.id = $1
                    GROUP BY e.id, u.id, el.id, l.id, p.id`;
                const values = [id];
                const result = await client.query(sql, values);
                await client.end();
    
                return result;
            } catch (error) {
                console.error('Error en repositorio:', error);
                throw error;
            }
        }
    }
    const verifyToken = (req, res, next) => {
        const authHeader = req.headers['authorization'];
        const token = authHeader && authHeader.split(' ')[1];
    
        if (token == null) return res.sendStatus(401);
    
        jwt.verify(token, process.env.SECRET_KEY, (err, user) => {
            if (err) return res.sendStatus(403);
            req.user = user;
            next();
        });
    };

    