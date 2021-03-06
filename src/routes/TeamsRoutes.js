const express = require('express');
const route = express.Router();
const teams = require('../controllers/TeamsController');

route.post('/teams',teams.createTeam);
route.get('/teams',teams.getTeams);
route.get('/teams/:id',teams.getMembers);
route.get('/teams_categories',teams.getCategories);

module.exports = route;