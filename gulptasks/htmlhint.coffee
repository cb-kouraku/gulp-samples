gulp = require 'gulp'
plugins = prop.plugins
config = prop.config

# htmlhint
module.exports = do ->
	gulp.task 'htmlhint', ->
		gulp
		.src [
			config.paths.pub+'**/*.html'
		]
		.pipe plugins.plumber
			errorHandler: plugins.notify.onError 'Error: <%= error.message %>'
		.pipe plugins.cached('htmlhint_log')
		.pipe plugins.htmlhint('htmlhintrc.json')
		.pipe plugins.htmlhint.failReporter()
		return
