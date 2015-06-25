gulp = require 'gulp'
browserSync = require 'browser-sync'

# 基本パス設定
paths =
	pub: 'htdocs/'

# BrowserSyncの設定
gulp.task 'browser-sync', ->
	browserSync.init
		server:
			# ルートを指定します
			baseDir: paths.pub
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
	browserSync.reload()
	return

# 以下コマンド -----------------------------

gulp.task 'default', [
	'browser-sync'
	'watch'
]
