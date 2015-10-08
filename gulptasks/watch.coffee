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

		gulp.watch [
			config.paths.src+'extend/**/*.html'
		],['html-extend']

		gulp.watch [
			config.paths.pub+'**/*.html'
		],['htmlhint']
		return

