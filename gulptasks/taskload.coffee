plugins = prop.plugins

# gulptaskのタスクをロード
module.exports = do ->
	files = plugins.fs.readdirSync(__dirname)
	files.forEach (file) ->
		require(__dirname + '/' + file)
		return
