const userSavings = require('../models/user_savings');
const UserRequestLoan = require('../models/requestloan');
const UserPaybackLoan = require('../models/paybackloan');
const ObjectId = require('mongodb').ObjectId;

exports.getSavingsTransactions = async (req, res) => {
    // const getTransaction = await userSavings.find({'saveTransactionMadeByID': ObjectId(req.params.gotUserId)}).populate("saveTransactionMadeByID");
    const getTransaction = await userSavings.find({ 'saveTransactionMadeByID': ObjectId(req.params.gotUserId) });
    res.json(getTransaction);
};

exports.createSavingsTransaction = async (req, res) => {
    const newTransaction = await new userSavings(req.body);
    console.log(newTransaction);
    await newTransaction.save();
    res.status(200).json({ message: "Saved Succesfully" });
};

exports.createRequestLoanTransaction = async (req, res) => {
    const newTransaction = await new UserRequestLoan(req.body);
    console.log(newTransaction);
    await newTransaction.save();
    res.status(200).json({ message: "Requested Succesfully" });
}

exports.getRequestLoanTransaction = async (req, res) => {
    const getTransactions = await UserRequestLoan.find({ 'requestLoanMadeByID': ObjectId(req.params.getUserId) });
    res.json(getTransactions);
}

exports.createPaybackLoanTransaction = async (req, res) => {
    const newTransaction = await UserRequestLoan.findByIdAndUpdate(ObjectId(req.params.getUserRequestLoanID), 
    { $push: { paybackPayments: UserPaybackLoan(req.body) }},
    { new: true, useFindAndModify: false }
    );
    console.log(newTransaction);
    console.log(UserPaybackLoan(req.body));
    await UserPaybackLoan(req.body).save();
    res.status(200).json({ message: "Saved Succesfully" });
}

exports.getPaybackloanTransaction = async (req, res) => {
    const getTransactions = await UserPaybackLoan.find({'requestLoanIDRef': ObjectId(req.params.requestLoanIdRef)});
    res.json(getTransactions);
}