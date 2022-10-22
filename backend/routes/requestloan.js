const express = require('express');
const { createRequestLoanTransaction, getRequestLoanTransaction } = require('../controllers/user_actions');
const { requestLoanValidator } = require('../validator/index')

const router = express.Router();

router.post('/requestloan', requestLoanValidator, createRequestLoanTransaction);
router.get('/:getUserId/getrequestedloans', getRequestLoanTransaction);

module.exports = router;