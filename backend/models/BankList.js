const mongoose = require('mongoose');

//read banks from db
const BankListSchema = new mongoose.Schema({
    name: {type: String},
    slug: {type: String},
    code: {type: String},
    ussd: {type: String}
})

module.exports = mongoose.model('BankList', BankListSchema);