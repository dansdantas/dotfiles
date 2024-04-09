local opt = vim.opt

--------------------------------------------------------------------------------
-- FILETYPES

-- make zsh files recognized as sh for bash-ls & treesitter
vim.filetype.add({
	extension = {
		zsh = "sh",
		sh = "sh", -- force sh-files with zsh-shebang to still get sh as filetype
	},
	filename = {
		[".zshrc"] = "sh",
		[".zshenv"] = "sh",
		[".ignore"] = "gitignore", -- fd ignore files
	},
})

--------------------------------------------------------------------------------
-- General
opt.encoding = "utf-8" -- Set encoding
opt.showmode = false -- Disable warning if changes modes on status line
opt.showcmd = false -- Does not show incomplete commands
opt.showmatch = true -- Show matcher when above cursor
opt.number = true -- Show line number
opt.autowrite = true -- Enable automatically :write before running commands
opt.hidden = true
opt.inccommand = "split"

-- Wrapping & Line Length
opt.colorcolumn = "120" -- Add delimitation line on 120 character
opt.wrap = false -- Remove wrapping on lines that goes over screen width

-- status bar & cmdline
opt.history = 400 -- reduce noise for command history search
opt.shortmess:append({ -- reduce info in :messages
	c = true, -- remove completion messages
	C = true, -- remove scanning tags messages
	w = true, -- use "[w]" instead of "written" for file write message	*shm-w*
	W = true, -- don't give written message or "[w]" when writing
	I = true, -- remove intro message
	s = true, -- s	don't give "search hit BOTTOM, continuing at TOP"
	F = true, -- remove file info when editing
})
opt.report = 9001 -- disable "x more/fewer lines" messages

-- Workspace
opt.signcolumn = "yes:1" -- Always show the signcolumn

-- Color
opt.termguicolors = true -- Enable true color
opt.background = "dark" -- Force dark background

-- Indentation
opt.shiftwidth = 2 -- Column space on identation << or >>
opt.tabstop = 2 -- Default tab space to 2 on tabs
opt.softtabstop = 2 -- Default tab space to 2 on spaces
opt.expandtab = true -- Convert tabs to spaces fallback, mostly set by .editorconfig
opt.smartindent = true -- Automatically inserts one extra level of indentation
opt.shiftround = true -- Calculate shiftwidth based on line start

-- Chars
opt.list = true
opt.listchars = { tab = "» ", extends = "›", precedes = "‹", nbsp = "␣", trail = "·" }

-- Turn off swap files
opt.swapfile = false -- Disable create of swap file
opt.backup = false -- Disable backup
opt.writebackup = false -- Disable backup before write

-- Scrolling
opt.scrolloff = 8 -- Start scrolling when we're 15 lines away from margins
opt.sidescrolloff = 8
opt.sidescroll = 1

-- Search
opt.hlsearch = false -- Do not highlight searches by default
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ...unless we type a capital
opt.incsearch = true

-- when closing a bracket, briefly flash the matching one
opt.showmatch = true
opt.matchtime = 1 -- deci-seconds

-- Keep undo history across sessions, by storing in file
local undo_dir = vim.env.XDG_DATA_HOME .. "/nvim/undo"
vim.fn.system({ "mkdir", "-p", undo_dir })
opt.undofile = true
opt.undodir = undo_dir

-- Folding
opt.foldmethod = "expr"
vim.wo.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.formatexpr = "v:lua.require'conform'.formatexpr()"
opt.foldlevel = 9999
opt.foldenable = false

-- Completion
opt.updatetime = 250 -- Reduce updatetime, also affects cursorword symbols and lsp-hints
opt.timeoutlen = 500 -- also affects duration until which-key is shown
opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }

-- Motions & Editing
opt.startofline = true -- motions like "G" also move to the first char
opt.virtualedit = "block" -- visual-block mode can select beyond end of line
opt.jumpoptions = "stack" -- https://www.reddit.com/r/neovim/comments/16nead7/comment/k1e1nj5/?context=3

-- Split
opt.splitbelow = true -- Split below on new split
opt.splitright = true -- Split right on new split

-- Popups & Cmdline
opt.pumheight = 15 -- max height

-- Abbreviations
vim.cmd([[iabbr dbg debugger]])

--------------------------------------------------------------------------------
-- Languages

local g = vim.g
local env = vim.env

-- Python
g.python_host_prog = env.PYENV_ROOT .. "/versions/2.7.18/bin/python"
g.python3_host_prog = env.PYENV_ROOT .. "/versions/3.12.0/bin/python"

-- Ruby
g.loaded_ruby_provider = 0
g.ruby_path = env.RBENV_ROOT .. "/shims"
g.ruby_host_prog = env.RBENV_ROOT .. "/shims/ruby"
