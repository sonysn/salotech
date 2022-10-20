const express = require('express');
const { getBankList } = require('../controllers/BankList')

const router = express.Router();

router.get('/getbanklist', getBankList);

module.exports = router;