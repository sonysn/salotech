const mongoose = require('mongoose');

const createTranSchema = new mongoose.Schema({
    account_bank:{
        type: String,
        default: "44"
    },
    account_number:{
        type: String,
        default: "0690000044"
    },
    amount:{},
    narration:{},
    currency:{}
})

module.exports = mongoose.model('fluttersave', createTranSchema);