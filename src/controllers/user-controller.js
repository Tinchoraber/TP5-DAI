import { Router } from 'express';
import userService from '../services/user-service.js';
const router = Router();
const svc = new userService();
router.post('/login', async (req, res) => {
    const infoSesion = req.body
    const login = await svc.loginAsync(infoSesion);
    res.status(login[1]).json(login[0]);
});

router.post('/register', async (req, res) => {
    const infoSesion = req.body
    const register = await svc.registerAsync(infoSesion);
    res.status(register[1]).json(register[0]);
});

export default router;