const express = require('express');
const { createPaybackLoanTransaction, getPaybackloanTransaction } = require('../controllers/user_actions');
const { paybackLoanValidator } = require('../validator/index');

const router = express.Router();

router.post('/:getUserRequestLoanID/paybackloan', paybackLoanValidator, createPaybackLoanTransaction );
router.get('/:requestLoanIdRef/getpaybackloan', getPaybackloanTransaction);

module.exports = router;