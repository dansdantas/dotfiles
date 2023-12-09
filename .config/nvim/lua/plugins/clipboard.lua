--# selene: allow(mixed_table) -- lazy.nvim uses them
local function is_whitespace(line)
	return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
	for _, entry in ipairs(tbl) do
		if not check(entry) then
			return false
		end
	end
	return true
end

return {
	{
		"AckslD/nvim-neoclip.lua",
		dependencies = {
			{ "kkharji/sqlite.lua", module = "sqlite" },
			{ "nvim-telescope/telescope.nvim" },
		},
		keys = {
			{
				"<leader>tp",
				function()
					require("telescope").extensions.neoclip.default()
				end,
				desc = "show yanked lines",
			},
		},
		opts = {
			filter = function(data)
				return not all(data.event.regcontents, is_whitespace)
			end,
			enable_persistent_history = true,
			keys = {
				telescope = {
					i = {
						paste = "<A-p>",
					},
				},
			},
		},
	},
}
