const mongoose = require('mongoose');

const requestLoanSchema = new mongoose.Schema({
    title: {
        type: String,
        default: 'Requested Loan'
    },
    amount: {
        type: Number,
        trim: true,
        required: true
    },
    requestLoanMadeBy: {
        type: String,
        required: true
    },
    requestLoanMadeByID: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    },
    creationDate: {
        type: Date,
        default: Date.now
    },
    description: {
        type: String,
        required: true
    },
    paybackPayments: [
        {
            type: mongoose.Schema.Types.ObjectId,
            ref: 'PaybackLoan'
        }
    ],
    verified: {
        type: String,
        default: 'No'
    }
})

module.exports = mongoose.model('UserRequestLoan', requestLoanSchema);