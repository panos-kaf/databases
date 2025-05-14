const express = require('express');
const router = express.Router();

//const queryController = require('../controllers/queryController');

//router.get('/q01', queryController.getQuery01);
/*
router.get('/q02', queryController.getQuery02);
router.get('/q03', queryController.getQuery03);
router.get('/q04', queryController.getQuery04);
router.get('/q05', queryController.getQuery05);
router.get('/q06', queryController.getQuery06);
router.get('/q07', queryController.getQuery07);
router.get('/q08', queryController.getQuery08);
router.get('/q09', queryController.getQuery09);
router.get('/q10', queryController.getQuery10);
router.get('/q11', queryController.getQuery11);
router.get('/q12', queryController.getQuery12);
router.get('/q13', queryController.getQuery13);
router.get('/q14', queryController.getQuery14);
router.get('/q15', queryController.getQuery15);
*/

router.all('*', (req, res)=>
    res.status(404).json({ error: "Invalid endpoint."})
)

module.exports = router;