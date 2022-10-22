const mongoose = require('mongoose');

const paybackLoanSchema = new mongoose.Schema({
    title: {
        type: String,
        default: 'Paidback Loan'
    },
    amount: {
        type: Number,
        trim: true,
        required: true
    },
    paybackLoanMadeBy: {
        type: String,
        required: true
    },
    paybackLoanMadeByID: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User',
        required: true
    },
    requestLoanIDRef: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'UserRequestLoan'
    },
    creationDate: {
        type: Date,
        default: Date.now
    },
    verified: {
        type: String,
        default: 'No'
    }
})

module.exports = mongoose.model('UserPaybackLoan', paybackLoanSchema);