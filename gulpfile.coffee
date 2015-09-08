gulp = require 'gulp'
# gulp- 系のプラグインを plugins.xxxx で利用する(ハイフン付モジュール名はキャメルケース)
plugins = require('gulp-load-plugins')(
	pattern: [
		'gulp-*'
		'gulp.*'
	]
	replaceString: /\bgulp[\-.]/)

# gulp- 系以外のモジュール
plugins.browserSync = require 'browser-sync'
plugins.connectSSI = require 'connect-ssi'
plugins.fs = require 'fs'
plugins.path = require 'path'

# gulp設定情報読込
config = require './gulpconfig.json'

# global設定
global.prop =
	plugins: plugins
	config: config

# gulptask読込
require './gulptasks/taskload'

# 以下コマンド -----------------------------

gulp.task 'default', [
	'browser-sync'
	'html-extend'
	'watch'
]
