const BankList = require('../models/BankList')

exports.getBankList = async (req, res) => {
    const getBank = await BankList.find()
    res.json(getBank)
}