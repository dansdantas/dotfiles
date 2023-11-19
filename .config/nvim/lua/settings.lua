local o = vim.opt

--- General
o.encoding = "utf-8" -- Set encoding
o.showmode = false -- Disable warning if changes modes on status line
o.showcmd = false -- Does not show incomplete commands
o.showmatch = true -- Show matcher when above cursor
o.number = true -- Show line number
o.colorcolumn = "120" -- Add delimitation line on 120 character
o.splitbelow = true -- Split below on new split
o.splitright = true -- Split right on new split
o.autowrite = true -- Enable automatically :write before running commands
o.hidden = true
o.signcolumn = "yes" -- Always show the signcolumn
o.wrap = false -- Remove wrapping on lines that goes over screen width

-- Color
o.termguicolors = true -- Enable true color
o.background = "dark" -- Force dark background

-- Indentation
o.shiftwidth = 2 -- Column space on identation << or >>
o.tabstop = 2 -- Default tab space to 2 on tabs
o.softtabstop = 2 -- Default tab space to 2 on spaces
o.expandtab = true -- Convert tabs to spaces
o.smartindent = true -- Automatically inserts one extra level of indentation
o.shiftround = true -- Calculate shiftwidth based on line start

-- Chars
o.list = true

-- Turn off swap files
o.swapfile = false -- Disable create of swap file
o.backup = false -- Disable backup
o.writebackup = false -- Disable backup before write

-- Scrolling
o.scrolloff = 8 -- Start scrolling when we're 15 lines away from margins
o.sidescrolloff = 8
o.sidescroll = 1

-- Search
o.hlsearch = false -- Do not highlight searches by default
o.ignorecase = true -- Ignore case when searching...
o.smartcase = true -- ...unless we type a capital
o.incsearch = true

-- Abbreviations
vim.cmd([[iabbr dbg debugger]])

-- Keep undo history across sessions, by storing in file
local undo_dir = vim.env.XDG_DATA_HOME .. "/nvim/undo"
vim.fn.system({ "mkdir", "-p", undo_dir })
o.undofile = true
o.undodir = undo_dir

-- Folding
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldlevel = 9999
o.foldenable = false

-- Completion
o.updatetime = 50 -- Reduce updatetime
o.shortmess:append({ ["c"] = true })

local g = vim.g
local env = vim.env

-- Python
g.python_host_prog = env.PYENV_ROOT .. "/versions/2.7.18/bin/python"
g.python3_host_prog = env.PYENV_ROOT .. "/versions/3.11.1/bin/python"

-- Ruby
g.loaded_ruby_provider = 0
g.ruby_path = env.RBENV_ROOT .. "/shims"
g.ruby_host_prog = env.RBENV_ROOT .. "/shims/ruby"
