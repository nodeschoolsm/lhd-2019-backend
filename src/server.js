const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv').config();
const cors = require('cors');
const hackerRoutes = require('./routes/HackersRoutes');
const teamsRoutes = require('./routes/TeamsRoutes');
const usersRoutes = require('./routes/UsersRoutes');

const app = express();



/* Middlewares */
app.use(bodyParser.json());
app.use(cors());


/* Routes */
app.use('/api',hackerRoutes);
app.use('/api',teamsRoutes);
app.use('/api',usersRoutes);


app.listen(process.env.PORT,() => console.log(`Server on port ${process.env.PORT}`))