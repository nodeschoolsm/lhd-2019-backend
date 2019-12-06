const express = require('express');
const route = express.Router();
const hackers = require('../controllers/UsersController');

route.post('/user',hackers.createUser);
route.post('/user/login',hackers.loginUser);


module.exports = route;