const userSavings = require('../models/user_savings');
const ObjectId = require('mongodb').ObjectId;

exports.getSavingsTransactions = async (req, res) => {
    // const getTransaction = await userSavings.find({'saveTransactionMadeBy': ObjectId(req.params.gotUserId)}).populate("saveTransactionMadeBy");
    const getTransaction = await userSavings.find({'saveTransactionMadeBy': ObjectId(req.params.gotUserId)});
    res.json(getTransaction);
};

exports.createSavingsTransaction = async (req, res) => {
    const newTransaction = await new userSavings(req.body);
    console.log(newTransaction);
    await newTransaction.save();
    res.status(200).json({ message: "Saved Succesfully" });
};