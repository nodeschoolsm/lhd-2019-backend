const express = require('express');
const route = express.Router();
const hackers = require('../controllers/HackersController')

route.get('/hackers',hackers.getHackers);

module.exports = route;