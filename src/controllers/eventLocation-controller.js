import { Router } from 'express';
import EventLocationService from '../services/eventLocation-service.js';
import ValidacionesHelper from '../helpers/validaciones-helper.js';
import jwt from 'jsonwebtoken';
const router = Router();
const svc = new EventLocationService();
const verifyToken = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];
    
    if (token == null) {
      console.log('No token provided');
      return res.sendStatus(401); // No token provided
    }
    
    const secretKey = process.env.ACCESS_TOKEN_SECRET || 'ClaveSuperSecreta2006$';
    jwt.verify(token, secretKey, (err, user) => {
      if (err) {
        console.log('Token verification failed', err);
        return res.sendStatus(403); // Invalid token
      }
      
      console.log('Token verified successfully', user);
      req.user = user; // Store user information in request
      next();
    });
  };
  router.get('', verifyToken, async (req, res) => {
    const returnArray = await svc.getAllEventsLocationsAsync();
    res.status(returnArray[1]).json(returnArray[0]);
  });

export default router;