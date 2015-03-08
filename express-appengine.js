/*
 * This class contains code necessary to get node to play
 * nice with Google App Engine
 */

var appengine = require ('appengine');

module.exports = exports = function (app) {
	app.use(appengine.middleware.base);

	app.get('/_ah/health', function(req, res) {
	  res.set('Content-Type', 'text/plain');
	  res.send(200, 'ok');
	});

	app.get('/_ah/start', function(req, res) {
	  res.set('Content-Type', 'text/plain');
	  res.send(200, 'ok');
	});

	app.get('/_ah/stop', function(req, res) {
	  res.set('Content-Type', 'text/plain');
	  res.send(200, 'ok');
	  process.exit();
	});

	return appengine;
};
