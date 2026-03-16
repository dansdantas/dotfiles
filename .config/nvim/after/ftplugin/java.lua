-- In your ftplugin/java.lua (recommended approach)
local config = {
	cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
	root_dir = vim.fs.dirname(vim.fs.find({ "pom.xml", "build.gradle", ".git" }, { upward = true })[1]),
	settings = {
		java = {
			configuration = {
				runtimes = {
					{
						name = "JavaSE-26",
						path = vim.fn.expand("~/.local/share/mise/installs/java/26"),
					},
				},
			},
		},
	},
	-- For debugging support
	init_options = {
		bundles = {}, -- we'll add java-debug here
	},
}

require("jdtls").start_or_attach(config)
