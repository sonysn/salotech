const express = require('express');
const { Transfer } = require('../controllers/flutterwave');

const router = express.Router();

router.post('/transfer', Transfer);

module.exports = router;