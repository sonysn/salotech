exports.userSignupValidator = (req, res, next) => {
    //first and last name not null

    req.check('firstName', "First name is required!").notEmpty();
    req.check('lastName', "Last name is required!").notEmpty();

    //phone number not null and phone number length
    req.check('phoneNumber', "Phone number is required!").notEmpty();
    req.check('phoneNumber', "Phone number is not complete!").isLength({
        min: 11
    });
    req.check('phoneNumber', "Phone number is too long!").isLength({
        max: 11
    });

    //phone number = password also checks for password
    req.check('password', "Password is required").notEmpty();

    //account number not null
    req.check('accountNumber', "Account Number is required!").notEmpty();


    //check for errors
    const errors = req.validationErrors();
    //show first errors as they happen
    if (errors) {
        const firstError = errors.map(error => error.msg)[0];
        return res.status(400).json({ error: firstError });
    }
    //proceed to next middleware
    next();
};


exports.createSaveTransactionValidator = (req, res, next) => {
    //check amount and date not null

    req.check('amount', "Amount is required!").notEmpty();
    req.check('amount', "Not a Number!").isNumeric();

    //check for errors
    const errors = req.validationErrors();
    //show first errors as they happen
    if (errors) {
        const firstError = errors.map(error => error.msg)[0];
        return res.status(400).json({ error: firstError });
    }
    //proceed to next middleware
    next();
}