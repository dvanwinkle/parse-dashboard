var express = require('express');
var ParseDashboard = require('./Parse-Dashboard/app');

var dashboard = new ParseDashboard(process.env.PARSE_DASHBOARD_CONFIG);

var app = express();

// make the Parse Dashboard available at /dashboard
app.use('/', dashboard);

var httpServer = require('http').createServer(app);
httpServer.listen(4040);
