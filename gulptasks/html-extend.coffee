gulp = require 'gulp'
config = prop.config
plugins = prop.plugins

# ExtendHTML
module.exports = do ->
	gulp.task 'html-extend', ->
		gulp
		.src [
			config.paths.src+'/extend/modules/**/*.html'
		]
		.pipe plugins.htmlExtend
			annotations: false
			verbose: false
			root: config.paths.src+'/extend'
		.pipe gulp.dest config.paths.pub
		return
