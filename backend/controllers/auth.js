const User = require("../models/user");

exports.signup = async (req, res) => {
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