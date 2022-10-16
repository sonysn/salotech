const express = require('express');
const { getSavingsTransactions, createSavingsTransaction } = require('../controllers/user_actions');
const { createSaveTransactionValidator } = require('../validator');

const router = express.Router();

router.post('/createsavetransaction', createSaveTransactionValidator, createSavingsTransaction);
//this weird looking thing is a header
router.get('/:gotUserId/getsavings', getSavingsTransactions);

module.exports = router;