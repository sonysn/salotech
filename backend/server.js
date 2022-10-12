const express = require('express')
const app = express()
const mongoose = require('mongoose')
const dotenv = require('dotenv')
dotenv.config()

//db
mongoose.connect(process.env.MONGO_URI, {useNewUrlParser: true, useUnifiedTopology: true})
.then(() => console.log('DB Connected'))

mongoose.connection.on('error', err => {
    console.log(`DB Connection error: ${err.message}`)
})

//bring in routes
const authRoutes = require('./routes/auth');

//middleware
app.use('/', authRoutes);

app.get('/', (req, res) => {
                 res.send('Hello world from nodejs')
             });

const port = process.env.PORT || 8080;
app.listen(port, () => {console.log(`A Node Js API is listening on port: ${port}`);
});