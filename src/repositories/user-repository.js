import config from "../configs/db-configs.js";
import pkg from "pg";
import jwt from 'jsonwebtoken';
const { Client, Pool } = pkg;

export default class userRepository {
    loginAsync = async (body) => {
        const client = new Client(config);
        await client.connect();
        let username = body.email;
        let password = body.contraseña;
        const sql = `SELECT * FROM users WHERE username = $1 and password = $2`;
        const values = [username, password];
        const result = await client.query(sql, values);
        await client.end();
        
        if(result.rowCount == 0){
            return [{
                success: false,
                message: "Usuario o clave inválida.",
                token: ""
            }, 401];
        }

        const user = result.rows[0];
        const payload = {
            id: user.id,
            username: user.username
        };
        const secretKey = process.env.ACCESS_TOKEN_SECRET || 'ClaveSuperSecreta2006$';
        const token = jwt.sign(payload, secretKey);

        const validar = this.validarUsername(username); 
        if(!validar){
            return [{
                success: false,
                message: "El email es inválido.",
                token: ""
            }, 400];
        } else {
            return [{
                result: result.rows[0],
                message: "Inicio de sesión exitoso.",
                token: token
            }, 200];
        }
    }

    registerAsync = async (body) => {
        const client = new Client(config);
        await client.connect();
        console.log(body)
        let first_name = body.nombre;
        let last_name = body.apellido;
        let username = body.email;
        let password = body.contraseña;
        const sql = `INSERT INTO users(first_name, last_name, username, password)
        VALUES($1, $2, $3, $4)`;
        const values = [first_name, last_name, username, password];
        const result = await client.query(sql, values);
        await client.end();
        const validar = this.validarUsername(username); 
        if(!validar){
            return ['ERROR, El email (username) es sintácticamente inválido.', 400];
        } else if(first_name.length < 3 || last_name.length < 3){
            return ['ERROR, Los campos first_name o last_name están vacíos o tienen menos de tres letras', 400];
        } else if(password.length < 3){
            return ['ERROR, El campo password está vacío o tiene menos de tres letras.', 400];
        } else {
            return ['Created', 201];
        }
    }

    validarUsername(username) {
        // Expresión regular para validar un correo electrónico
        const regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
        return regex.test(username);
    }
}
