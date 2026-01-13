return {
	autostart = false,
	cmd = { "solargraph", "stdio" }, -- or just omit `cmd`
	settings = {
		init_options = {
			formatting = true,
		},
		solargraph = {
			diagnostics = true,
			formatting = false,
		},
	},
}
