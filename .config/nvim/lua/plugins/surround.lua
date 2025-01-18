return {
	{
		"kylechui/nvim-surround",
		opts = {
			surrounds = {
				["F"] = { add = function() return { { "function() " }, { " end" } } end },
			},
		},
	},
}
