gulp = require 'gulp'
plugins = prop.plugins
config = prop.config

# SSI
module.exports = do ->
	# SSI Code Change : file -> virtual
	gulp.task 'ssiChangeVirtual', ->
		gulp
		.src config.paths.pub+'**/*.html'
		.pipe plugins.plumber()
		.pipe plugins.replace(/<!--#include file/g, '<!--#include virtual')
		.pipe gulp.dest config.paths.pub
		return

	# SSI Code Change : virtual -> file
	gulp.task 'ssiChangeFile', ->
		gulp
		.src config.paths.pub+'**/*.html'
		.pipe plugins.plumber()
		.pipe plugins.replace(/<!--#include virtual/g, '<!--#include file')
		.pipe gulp.dest config.paths.pub
		return
