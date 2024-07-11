import config from "../configs/db-configs.js";
import pkg from "pg";
import jwt from 'jsonwebtoken';
const { Client, Pool } = pkg;

export default class userRepository {
    loginAsync = async (body) => {
        const client = new Client(config);
        await client.connect();
        let username = body.username;
        let password = body.password;
        const sql = `SELECT * FROM users WHERE username = $1 and password = $2`;
        const values = [username, password];
        const result = await client.query(sql, values);
        await client.end();
        const payload = {
            id: result.id,
            username: result.username
        }
        const secretKey = 'ClaveSuperSecreta2006$';
        const token = jwt.sign(payload, secretKey);
        const validar = this.validarUsername(username); 
        if(!validar){
            return [{
                success: false,
                message: "El email es inválido.",
                token: ""
            }, 400];
        }
        else if(result.rows.length == 0){
            return [{
                success: false,
                message: "Usuario o clave invalida.",
                token: ""
            }, 401];
        }
        else{
            return[{
                success: true,
                message: "",
                token: token
            }, 200]
        }

}

registerAsync = async (body) => {
    const client = new Client(config);
    await client.connect();
    let first_name = body.first_name;
    let last_name = body.last_name;
    let username = body.username;
    let password = body.password;
    const sql = `INSERT INTO users(first_name, last_name, username, password)
    VALUES($1, $2, $3, $4)`;
    const values = [first_name, last_name, username, password];
    const result = await client.query(sql, values);
    await client.end();
    const validar = this.validarUsername(username); 
    if(!validar){
        return ['ERROR, El email (username) es sintácticamente inválido.', 400];
    }
    else if(first_name.length < 3 ||last_name.length < 3){
        return ['ERROR, Los campos first_name o last_name están vacíos o tienen menos de tres letras', 400];
    }
    else if(password.length < 3){
        return ['ERROR, El campo password está vacío o tiene menos de tres letras.', 400]
    }
    else{
        return ['Created', 201]
    }

}

validarUsername(username) {
    // Expresión regular para validar un correo electrónico
    const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    return regex.test(username);
}
}