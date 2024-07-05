import 'dotenv/config';

export const PORT = process.env.PORT ?? 3000;

export const BACKEND_URL = process.env.PROCESS_BACKEND_URL ?? '';

export const DB_HOSTNAME = process.env.DB_HOSTNAME ?? '';
export const DB_USERNAME = process.env.DB_USERNAME ?? '';
export const DB_PASSWORD = process.env.DB_PASSWORD ?? '';
export const DB_DATABASE = process.env.DB_DATABASE ?? '';

export const AUTH_HS256_KEY = process.env.AUTH_HS256_KEY ?? '';
export const BASE_URL = process.env.BASE_URL ?? '';