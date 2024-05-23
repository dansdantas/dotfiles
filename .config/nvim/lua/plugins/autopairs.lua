--# selene: allow(mixed_table) -- lazy.nvim uses them
return {
	"windwp/nvim-autopairs",
	config = function()
		require("config.autopairs")
	end,
}
