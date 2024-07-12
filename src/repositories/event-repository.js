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
        async getEnrollments(id, firstName, lastName, username, attended, rating) {
            const client = await this.pool.connect();
            let query = `SELECT json_build_object(
                'id', u.id, 
                'first_name', u.first_name, 
                'last_name', u.last_name, 
                'username', u.username
            ) AS user, ee.attended, ee.rating, ee.description
            FROM users u 
            INNER JOIN events_enrollments ee ON u.id = ee.id_user
            WHERE ee.id_event = $1`;
            const values = [id];
            let countParams = 1;
            if (firstName) {
                query += ` AND u.first_name = $${++countParams}`;
                values.push(firstName);
                countParams++;
            }
            if (lastName) {
                query += ` AND u.last_name = $${++countParams}`;
                values.push(lastName);
                countParams++;
            }
            if (username) {
                query += ` AND u.username = $${++countParams}`;
                values.push(username);
                countParams++;
            }
            if (attended !== null) {
                query += ` AND ee.attended = $${++countParams}`;
                values.push(attended);
                countParams++;
            }
            if (rating) {
                query += ` AND ee.rating = $${++countParams}`;
                values.push(rating);
                countParams++;
            }
            
            try {
                const result = await client.query(query, values);
                const rows = result.rows;
                const response = {
                    collection: rows,
                    pagination: {
                        limit: 15,
                        offset: 0,
                        nextPage: null,
                        total: rows.length
                    }
                };
                return response;
            }
            catch (error) {
                console.error(error);
                return null;
            }
            finally {
                client.release();
            }
        }
        insertEventsAsync = async (body) => {
                const client = new Client(config);
                await client.connect();
                const sql = 'SELECT max_capacity from event_locations';
                const maximaCapacidad = await client.query(sql)
                const sql2 = `INSERT INTO events 
                                (name, description, id_event_category, id_event_location, start_date, duration_in_minutes, price, max_assistance, id_creator_user, enabled_for_enrollment)
                             VALUES
                             ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)`;
                let nombre = body.name;
                let descripcion = body.description;
                let id_evento_categoria = body.id_event_category;
                let id_evento_locacion = body.id_event_location;
                let fechaQueEmpieza = body.start_date;
                let duracion_en_minutos = body.duration_in_minutes;
                let precio = body.price;
                let maxima_asistencia = body.max_assistance;
                let id_creador_user = body.id_creator_user;
                let enabled_para_enrollment = body.enabled_for_enrollment;
                const values = [nombre, descripcion, id_evento_categoria, id_evento_locacion, fechaQueEmpieza, duracion_en_minutos, precio, maxima_asistencia, id_creador_user, enabled_para_enrollment];
                const result = await client.query(sql2, values);
                await client.end();
            if(nombre < 3 || descripcion < 3){
                return ['Bad Request', 400];
            }
            else if(maxima_asistencia > maximaCapacidad){
                return ['Bad Request', 400];
            }
            else if(precio < 0 ||duracion_en_minutos < 0){
                return ['Bad Request', 400];
            }
            else{
              return ['Created', 201];
            }
        }
        updateEventsAsync = async (body) => {
            const client = new Client(config);
            await client.connect();
            const sql = 'SELECT max_capacity from event_locations';
            const maximaCapacidad = await client.query(sql)
            const sql2 = `UPDATE events 
                            SET name = $1, description = $2, id_event_category =  $3, id_event_location = $4, start_date = $5, duration_in_minutes = $6, price = $7, max_assistance = $8, enabled_for_enrollment = $9 WHERE id = $10 AND id_creator_user = $11`;
            let id = body.id
            let nombre = body.name;
            let descripcion = body.description;
            let id_evento_categoria = body.id_event_category;
            let id_evento_locacion = body.id_event_location;
            let fechaQueEmpieza = body.start_date;
            let duracion_en_minutos = body.duration_in_minutes;
            let precio = body.price;
            let maxima_asistencia = body.max_assistance;
            let id_creador_user = body.id_creator_user;
            let enabled_para_enrollment = body.enabled_for_enrollment;
            const values = [nombre, descripcion, id_evento_categoria, id_evento_locacion, fechaQueEmpieza, duracion_en_minutos, precio, maxima_asistencia, enabled_para_enrollment, id, id_creador_user];
            console.log(values)
            const result = await client.query(sql2, values);
            console.log(result)
            await client.end();
        if(nombre < 3 || descripcion < 3){
            return ['Bad Request', 400];
        }
        else if(maxima_asistencia > maximaCapacidad){
            return ['Bad Request', 400];
        }
        else if(precio < 0 ||duracion_en_minutos < 0){
            return ['Bad Request', 400];
        }
        else if(result.rowCount == 0){
            return ['ERROR, el id no existe o el evento no pertenece al usuario autenticado', 404];
        }
        else{
          return ['OK', 200];
        }
    }
    deleteEventAsync = async (id) => {
        const client = new Client(config);
        await client.connect();
        const sql1 = 'SELECT COUNT(id_user) FROM event_enrollments ee INNER JOIN events e ON ee.id_event = e.id WHERE e.id = $1';
        const values1 = [id];
        let cantidadUsuariosAnotados = await client.query(sql1, values1)
        const sql = `DELETE FROM events WHERE id = $1`;
        const values = [id];
        let eventoEliminado = await client.query(sql, values)
        if (eventoEliminado.rowCount == 0) {
           return ['ERROR, el id no existe o el evento no pertenece al usuario autenticado', 404] 
        }
        else if(cantidadUsuariosAnotados > 1){
            return ['ERROR, hay algun usuario registrado al evento', 400];
        }
        else {
            return [eventoEliminado, 200]
        }
    }
    async insertEventEnrollmentAsync(id, userId) {
        const client = new Client(config);
        await client.connect();
        try {
            const response = await client.query(
                `SELECT COUNT(*) AS enrolled, e.max_assistance
                FROM events_enrollments ee
                INNER JOIN events e ON ee.id_event = e.id
                WHERE ee.id_user = $1 AND ee.id_event = $2
                GROUP BY e.max_assistance`,
                [userId, id]
            );
            if (response.rowCount > 0) {
                if (response.rows[0].enrolled >= response.rows[0].max_assistance) {
                    return false;
                }
            }
        }
        catch (error) {
            console.error(error);
            return false;
        }
        try {
            await client.query(
                `INSERT INTO events_enrollments (id_user, id_event, registration_date_time)
                VALUES ($1, $2, now())`,
                [userId, id]
            );
            return true;
        } catch (error) {
            console.error(error);
            return false;
        }
        finally {
            client.release();
        }
    }

    async deleteEventEnrollmentsAsync(id, userId) {
        const client = new Client(config);
    await client.connect();
        let response;
        try {
            response = await client.query(
                `SELECT COUNT(*) AS enrolled, e.start_date
                FROM event_enrollments
                INNER JOIN events e ON event_enrollments.id_event = e.id
                WHERE id_user = $1 AND id_event = $2
                GROUP BY e.start_date`,
                [userId, id]
            );
            if (response.rowCount === 0) {
                return 404;
            }
        }
        catch (error) {
            console.error(error);
            return 404;
        }
        if (new Date() > response.rows[0].start_date) {
            return 400;
        }
        try {
            await client.query(
                `DELETE FROM event_enrollments WHERE id_user = $1 AND id_event = $2`,
                [userId, id]
            );
            return 200;
        } catch (error) {
            console.error(error);
            return false;
        }
        finally {
            client.release();
        }
    }

    async valorarEventEnrollmentsAsync(id, userId, rating) {
        const client = new Client(config);
        await client.connect();
        let response;
        try {
            response = await client.query(
                `SELECT COUNT(*) AS enrolled, e.start_date
                FROM event_enrollments
                INNER JOIN events e ON event_enrollments.id_event = e.id
                WHERE id_user = $1 AND id_event = $2
                GROUP BY e.start_date`,
                [userId, id]
            );
            if (response.rowCount === 0) {
                return false;
            }
        }
        catch (error) {
            console.error(error);
            return false;
        }
        if (new Date() < response.rows[0].start_date) {
            return false;
        }
        try {
            await client.query(
                `UPDATE event_enrollments SET rating = $1, attended = true WHERE id_user = $2 AND id_event = $3`,
                [rating, userId, id]
            );
            return true;
        } catch (error) {
            console.error(error);
            return false;
        }
        finally {
            client.release();
        }
    }
}
