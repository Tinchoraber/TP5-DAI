import express from "express";
import cors from "cors";
import ValidacionesHelper from "./src/helpers/validaciones-helper.js";
import ProvinceRouter from "./src/controllers/province-controller.js";
import EventRouter from "./src/controllers/event-controller.js";
import UserRouter from "./src/controllers/user-controller.js";
import eventCategoryRouter from './src/controllers/eventCategory-controller.js'
import LocationRouter from './src/controllers/Location-controller.js'
import EventLocationRouter from './src/controllers/eventLocation-controller.js'
const app = express();
const port = 3000; // El puerto 3000 (http://localhost:3000)
// Agrego los Middlewares
app.use(cors()); // Middleware de CORS.
app.use(express.json()); // Middleware para parsear y comprender JSON.
//
// Endpoints (todos los Routers)
//
app.use("/api/province", ProvinceRouter);
app.use("/api/event", EventRouter);
app.use("/api/user", UserRouter);
app.use("/api/eventCategory", eventCategoryRouter);
app.use("/api/location", LocationRouter);
app.use("/api/event-location", EventLocationRouter);
//
// Inicio el Server y lo pongo a escuchar.
//
app.listen(port, () => {
console.log(`Example app listening on port ${port}`)    
})

