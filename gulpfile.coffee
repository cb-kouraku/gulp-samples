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

# 基本パス設定
paths =
	pub: 'htdocs/'

# BrowserSyncの設定
gulp.task 'browser-sync', ->
	plugins.browserSync.init
		server:
			# ルートを指定します
			baseDir: paths.pub
			# middlewareを使う設定
			middleware: [
				# SSIの設定情報
				plugins.connectSSI(
					baseDir: __dirname + '/htdocs'
					ext: '.html'
				)
			]
		# gulp起動時に開くページを指定します
		startPath: 'index.html'
		# ポートを指定します（デフォルトは3000）
		port: 3040
		# External IPでブラウザを開けます（スマホで確認する時に重宝）
		open: "external"
	return

# ファイル監視
gulp.task 'watch', ->
	gulp.watch [
		paths.pub+'**/*.js'
		paths.pub+'**/*.html'
		paths.pub+'**/*.css'
	],['reload']
	return

# リロード
gulp.task 'reload', ->
	plugins.browserSync.reload()
	return

# SSI Code Change : file -> virtual
gulp.task 'ssiChangeVirtual', ->
	gulp
	.src paths.pub+'**/*.html'
	.pipe plugins.plumber()
	.pipe plugins.replace(/<!--#include file/g, '<!--#include virtual')
	.pipe gulp.dest paths.pub
	return

# SSI Code Change : virtual -> file
gulp.task 'ssiChangeFile', ->
	gulp
	.src paths.pub+'**/*.html'
	.pipe plugins.plumber()
	.pipe plugins.replace(/<!--#include virtual/g, '<!--#include file')
	.pipe gulp.dest paths.pub
	return

# 以下コマンド -----------------------------

gulp.task 'default', [
	'browser-sync'
	'watch'
]
