import Router from 'express';
import eventCategoryService from '../services/eventCategory-service.js';
const router = Router();
const svc = new eventCategoryService();
router.get('', async (req, res) => {
  const returnArray = await svc.getAllEventCategoriesAsync();
  res.status(returnArray[1]).json(returnArray[0]);
});

router.get('/:id', async (req, res) => {
  const id = req.params.id;
  const returnArray = await svc.getAllEventCategoriesByIdAsync(id);
  res.status(returnArray[1]).json(returnArray[0]);
});

router.post('', async (req, res) => {
  const body = req.body;
  const returnArray = await svc.insertEventCategoriesAsync(body);
  res.status(returnArray[1]).json(returnArray[0]);
});

router.put('', async (req, res) => {
  const body = req.body;
  const returnArray = await svc.updateEventCategoriesAsync(body);
  res.status(returnArray[1]).json(returnArray[0]);
});

router.delete('/:id', async (req, res) => {
  const id = req.params.id;
  const returnArray = await svc.deleteEventCategoriesAsync(id);
  res.status(returnArray[1]).json(returnArray[0]);
});
export default router;