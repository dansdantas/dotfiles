return {
	root_dir = function()
		-- vim.fn.getcwd()
		return vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1])
	end,
}
