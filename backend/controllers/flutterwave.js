const RavePay = require('flutterwave-node');
const fluttersave = require('../models/flutterai');

const PUBLICK_KEY = 'FLWPUBK_TEST-b6360d3b405cc4657797aa7ddfe550a8-X';
const SECRET_KEY = 'FLWSECK_TEST-8388405828b88ce929629bc994fe9917-X';

const rave = new RavePay(PUBLICK_KEY, SECRET_KEY);

// const transfer = async () => {
//     try {
        // const payload = {
        //     "account_bank": "044",
        //     "account_number": "0690000044",
        //     "amount": 500,
        //     "narration": "New transfer",
        //     "currency": "NGN",
        //     "reference":"trans-"+ Date.now()
        // }
//         const response = await rave.Transfer.initiate(payload)
//         console.log(response)

//     } catch (error) {
//         console.log(error)
//     }
// }
// transfer();

exports.Transfer = async (req, res, next) => {
    try {
        // const account_bank = "44";
        // const account_number = "0690000044";
        const payload = await new fluttersave(req.body);
        const response = await rave.Transfer.initiate(payload);
        console.log(response.data)
        res.status(200).json({ response });

    }  catch (error) {
        console.log(error)
    }
    next();
}