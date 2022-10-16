const mongoose = require('mongoose');

const userSavingsSchema = new mongoose.Schema({
    amount: {
        type: Number,
        trim: true,
        required: true
        },
    creationDate: {
        type: Date,
        default: Date.now
        },
    saveTransactionMadeBy: {
        type: mongoose.Schema.Types.ObjectId,
        ref: 'User'
    }
})

module.exports = mongoose.model('userSavings', userSavingsSchema);