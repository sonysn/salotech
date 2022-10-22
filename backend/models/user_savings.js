const mongoose = require('mongoose');

const userSavingsSchema = new mongoose.Schema({
    title: {
        type: String,
        default: 'Save Deposit'
    },
    amount: {
        type: Number,
        trim: true,
        required: true
    },
    saveTransactionMadeBy: {
        type: String,
        required: true,
        immutable: true
    },
    saveTransactionMadeByID: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
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

module.exports = mongoose.model('userSavings', userSavingsSchema);