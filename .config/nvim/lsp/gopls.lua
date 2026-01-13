return {
	cmd = { "gopls" },
	settings = {
		gopls = {
			experimentalPostfixCompletions = true,
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			semanticTokens = true,
			gofumpt = true,
		},
	},
	init_options = {
		usePlaceholders = true,
	},
}
