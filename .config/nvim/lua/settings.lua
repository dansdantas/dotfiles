local api = vim.api

--- General
api.nvim_set_option('encoding', 'utf-8')  -- Set encoding
api.nvim_set_option('showmode', false)    -- Disable warning if changes modes on status line
api.nvim_set_option('showcmd', false)     -- Does not show incomplete commands
api.nvim_set_option('showmatch', true)    -- Show matcher when above cursor
api.nvim_set_option('number', true)       -- Show line number
api.nvim_set_option('colorcolumn', '120') -- Add delimitation line on 120 character
api.nvim_set_option('splitbelow', true)   -- Split below on new split
api.nvim_set_option('splitright', true)   -- Split right on new split
api.nvim_set_option('autowrite', true)    -- Enable automatically :write before running commands
api.nvim_set_option('hidden', true)
api.nvim_set_option('signcolumn', 'yes')  -- Always show the signcolumn

-- Indentation
api.nvim_set_option('shiftwidth', 2)     -- Column space on identation << or >>
api.nvim_set_option('tabstop', 2)        -- Default tab space to 2 on tabs
api.nvim_set_option('softtabstop', 2)    -- Default tab space to 2 on spaces
api.nvim_set_option('expandtab', true)   -- Convert tabs to spaces
api.nvim_set_option('smartindent', true) -- Automatically inserts one extra level of indentation
api.nvim_set_option('shiftround', true)  -- Calculate shiftwidth based on line start

-- Colors configuration
api.nvim_set_var('onedark_terminal_italics', 1)
api.nvim_set_var('onedark_hide_endofbuffer', 1)
api.nvim_set_option('termguicolors', true) -- Enable true color
api.nvim_set_option('background', 'dark')  -- Force dark background
vim.cmd([[ colorscheme onedark ]])         -- Set colorscheme

-- Turn off swap files
api.nvim_set_option('swapfile', false)    -- Disable create of swap file
api.nvim_set_option('backup', false)      -- Disable backup
api.nvim_set_option('writebackup', false) -- Disable backup before write

-- Scrolling
api.nvim_set_option('scrolloff', 8)     -- Start scrolling when we're 15 lines away from margins
api.nvim_set_option('sidescrolloff', 8)
api.nvim_set_option('sidescroll', 1)

-- Search
api.nvim_set_option('hlsearch', false)  -- Do not highlight searches by default
api.nvim_set_option('ignorecase', true) -- Ignore case when searching...
api.nvim_set_option('smartcase', true)  -- ...unless we type a capital

-- Abbreviations
vim.cmd[[iabbr pry binding.pry]]
vim.cmd[[iabbr dbg debugger]]
vim.cmd[[iabbr log console.log]]
vim.cmd[[abbr todo: <esc>:call AddToDo()<cr>]]

-- Keep undo history across sessions, by storing in file
vim.cmd([[call system('mkdir -p $XDG_DATA_HOME/nvim/undo')]])
api.nvim_set_option('undofile', true)
api.nvim_set_option('undodir', '$XDG_DATA_HOME/nvim/undo')

-- Folding
api.nvim_set_option('foldmethod', 'manual')
api.nvim_set_option('foldlevel', 9999)
