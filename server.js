var express = require ('express');
var browserify = require ('browserify-middleware');
var jade = require ('jade');
var lessMiddleware = require ('less-middleware');
var logger = require ('express-logger');

var express_appengine = require('./express-appengine.js');
var games = require ('./games.js');


// Process Command Line Arguments
var port = 80;
if (process.argv.length > 2) {
	port = parseInt (process.argv[2]);
}


// Set up the Server
var app = express ();
var appengine = express_appengine (app); // This is some bullshit!!!

app.set ('views', __dirname + '/views');
app.set ('view engine', 'jade');

app.use (logger ({
	path: './log'
}));

app.use ('/scripts', browserify ('./scripts/'));
app.use (lessMiddleware (__dirname + '/public'));
app.use (express.static (__dirname + '/public'));

app.get ('/', function (req, res) {
	res.render ('home', {
		title: "Brainsplosion Games"
	});
});

app.get ('/games', function (req, res) {
	res.render ('games', {
		title: 'Recommended Games',
		games: games
	});
});

app.get ('/contact', function (req, res) {
	res.render ('contact', {
		title: 'Contact Us'
	});
});


// Run the Server
app.listen(port);
