const express = require('express');
const bodyParser = require('body-parser');
const mySql = require('mysql');
const myConnection = require('express-myconnection');
const dotenv = require('dotenv').config();

const hackerRoutes = require('./routes/HackersRoutes')

const app = express();



/* Middlewares */
app.use(bodyParser.json())



/* Routes */
app.use('/api',hackerRoutes)

console.log(process.env.PORT)

app.listen(process.env.PORT,() => console.log('asdf'))