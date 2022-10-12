  const mongoose = require('mongoose');

  const userSchema = new mongoose.Schema({
    firstName: {
    type: String,
    trim: true,
    required: true
    },
    lastName: {
        type: String,
        trim: true,
        required: true
        },
    phoneNumber: {
        type: String,
        trim: true,
        required: true
        },
    password: {
        type: String,
        required: true
        },
    homeAddress: {
        type: String,
        trim: true,
        required: false
        },
     accountNumber: {
        type: String,
        trim: true,
        required: true
        },
      salt: String,
      created: {
        type: Date,
        default: Date.now
      },
      updated: Date
  }
  )

  module.exports = mongoose.model('User', userSchema)