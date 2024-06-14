import { Router } from 'express';
import ProvinceService from '../services/province-service.js';
import ValidacionesHelper from '../helpers/validaciones-helper.js';

const router = Router();
const svc = new ProvinceService();
    router.get('', async (req, res) => {
        try {
            const returnArray = await svc.getAllAsync();
            console.log(returnArray)
            res.status(200).json(returnArray[0]);
        } catch (error) {
            res.status(500).send('Error interno.');
        }
    });

    router.get('/:id', async (req, res) => {
        const id = ValidacionesHelper.getIntegerOrDefault(req.params.id, 0);
        try {
            const province = await svc.getByIdAsync(id);
            console.log(province)
            res.status(province[1]).json(province[0]);
        } catch (error) {
            res.status(404).send('Not Found');
        }
    });

    router.post('', async (req, res) => {
        const newProvince = req.body;
        try {
            const createdProvince = await svc.createAsync(newProvince);
            res.status(createdProvince[1]).json(createdProvince[0]);
        } catch (error) {
            res.status(400).json({error: "Error al insertar la Provincia"});
        }
    });

    router.put('/:id', async (req, res) => {
        const id = ValidacionesHelper.getIntegerOrDefault(req.params.id);
        const provinceToUpdate = req.body;
        try {
            const updatedProvince = await svc.updateAsync({ id, ...provinceToUpdate });
            res.status(updatedProvince[1]).json(updatedProvince[0]);
        } catch (error) {
            res.status(404).json({ error: "Provincia no actualizada" });
        }
    });

    router.delete('/:id', async (req, res) => {
        const id = ValidacionesHelper.getIntegerOrDefault(req.params.id, 0);
        try {
            const province = await svc.deleteByIdAsync(id);
            console.log(province)
            res.status(province[1]).json(province[0]);
        } catch (error) {
            res.status(404).send('Not Found');
        }
    });

export default router;