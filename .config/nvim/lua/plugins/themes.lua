--# selene: allow(mixed_table) -- lazy.nvim uses them
-- INFO only the first theme will be used
local lightThemes = {
	{ "EdenEast/nightfox.nvim", name = "dawnfox" },
	{
		"sainnhe/everforest",
		init = function()
			vim.g.everforest_background = "hard"
		end,
	},
	-- {
	-- 	"marko-cerovac/material.nvim",
	-- 	init = function()
	-- 		vim.g.material_style = "lighter"
	-- 	end,
	-- 	opts = { lualine_style = "stealth", high_visibility = { lighter = false } },
	-- },
}

local darkThemes = {
	"folke/tokyonight.nvim",
	"AlexvZyl/nordic.nvim",
	"ray-x/aurora",
	{ "tiagovla/tokyodark.nvim", opts = {} },
	{ "navarasu/onedark.nvim", opts = { style = "darker" } },
	{ "ray-x/starry.nvim", opts = { italics = { comments = true } } },
	"xero/miasma.nvim",
	"cpea2506/one_monokai.nvim",
	"shaunsingh/moonlight.nvim",
	-- { "folke/tokyonight.nvim", opts = { style = "moon" } },
	-- "ellisonleao/gruvbox.nvim",
	-- "AlexvZyl/nordic.nvim",
	-- "sainnhe/gruvbox-material",
	-- "sainnhe/sonokai",
	-- "rebelot/kanagawa.nvim",
}

--------------------------------------------------------------------------------

-- INFO The purpose of this is not having to manage two lists, one with themes
-- to install and one for determining light/dark theme

---convert lazy.nvim-plugin-spec or github-repo into theme name
---@param repo string|table either github-repo or plugin-spec with github-repo as first item
---@nodiscard
---@return string name of the color scheme
local function getName(repo)
	if type(repo) == "table" then
		repo = repo.name or repo[1]
	end
	local name = repo:gsub(".*/", ""):gsub("[.%-]?nvim$", ""):gsub("neovim%-?", "")
	return name
end

vim.o.termguicolors = true -- Enable true color
vim.o.background = "dark" -- Force dark background
vim.g.lightTheme = getName(lightThemes[1])
vim.g.darkTheme = getName(darkThemes[1])

--------------------------------------------------------------------------------

-- merge tables
local allThemes = vim.list_extend(darkThemes, lightThemes)

-- ensure themes are never lazy-loaded https://github.com/folke/lazy.nvim#-colorschemes
allThemes = vim.tbl_map(function(theme)
	local themeObj = type(theme) == "string" and { theme } or theme
	themeObj.lazy = false
	themeObj.priority = 1000
	return themeObj
end, allThemes)

-- return for lazy
return allThemes
