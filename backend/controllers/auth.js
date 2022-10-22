const jwt = require('jsonwebtoken');
require('dotenv').config();
const User = require("../models/user");

exports.signup = async (req, res) => {
    //chek if user exists with account number
    const userExists = await User.findOne({ accountNumber: req.body.accountNumber });
    console.log(userExists);
    if(userExists) 
        return res.status(403).json({
            error: "User already Exists!"
    });
    const user = await new User(req.body);
    await user.save();
    res.status(200).json({ message: "Signup success! Please login." });
};

exports.signin = (req, res) => {
    //find user based on account number
    const {_id, accountNumber, password} = req.body
    User.findOne({accountNumber}, (err, user) => {
        //if err or no user
        if(err || !user) {
            return res.status(401).json({
                error: "User with that account number does not exist. Please signup or check and try again!"
            })
        }
         //if error or no user
        // if user, authenticate
        //if user is found, make sure account number and pasword match
        //create authenticate method in model and use here
        if(!user.authenticate(password)) {
            return res.status(401).json({
                error: "Account number and Phone Number do not match"
            }) 
        }
        //generate a token with user id and secret
        const token = jwt.sign({_id: user._id}, process.env.JWT_SECRET);

        //succesfull login message
        const message = "Logged in!"

         //persist the token as 't' in cookie with expiry date
         res.cookie('t', token, {expire: new Date() + 9999})

         //return response with user and token to frontend client
         const {_id, firstName, lastName, accountNumber} = user
         console.log(user);
         return res.json({ token, user: { _id, firstName, lastName, accountNumber }, message});

    })

};

exports.signout = (req, res) => {
    res.clearCookie('t');
    return res.json({ message: 'Signout success!' });
};