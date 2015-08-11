gulp = require 'gulp'
plugins = prop.plugins
config = prop.config

# Watch
module.exports = do ->
	# ファイル監視
	gulp.task 'watch', ->
		gulp.watch [
			config.paths.pub+'**/*.js'
			config.paths.pub+'**/*.html'
			config.paths.pub+'**/*.css'
		],['reload']
		return
