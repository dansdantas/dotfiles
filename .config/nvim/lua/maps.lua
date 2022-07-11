local map = vim.keymap

-- Leader
map.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

map.set('n', '+', '<C-a>')
map.set('n', '-', '<C-x>')
map.set('n', ',l', ':nohl<cr>')

-- reload config
map.set('n', '<leader><cr>', ':so ~/.config/nvim/config.lua<CR>')

-- Handle save
map.set('n', '<leader>w', ':w!<cr>')
map.set('n', '<leader>x', ':x!<cr>')
map.set('n', '<leader>q', ':q<cr>')
map.set('n', '<leader>Q', ':qa<cr>')

-- Tab & Buffer movements
-- map.set('n', '<leader>j', ':tabprevious<cr>')
-- map.set('n', '<leader>k', ':tabnext<cr>')
map.set('n', '<leader>j', ':BufferLineCyclePrev<cr>')
map.set('n', '<leader>k', ':BufferLineCycleNext<cr>')
map.set('n', '<leader>h', ':bprev<cr>')
map.set('n', '<leader>l', ':bnext<cr>')

-- Split
map.set('n', '<C-J>', '<C-W><C-J>')
map.set('n', '<C-K>', '<C-W><C-K>')
map.set('n', '<C-L>', '<C-W><C-L>')
map.set('n', '<C-H>', '<C-W><C-H>')

-- Moviments
map.set('n', ';;', '$')
map.set('n', 'B', '^')
map.set('n', 'E', '$')

-- Clipboard
map.set('n', '<leader>p', '"+p')
map.set({ 'n', 'v' }, '<leader>y', '"+y')
map.set('n', 'Y', 'y$')

-- Buffers
map.set('n', '<leader>;', ':bd!<cr>')
map.set('n', ',b', ':%bd|e#<cr>')
map.set('n', ',B', ':%bd!<cr>')

-- Remove white space
map.set('n', '<leader><bs>', [[:%s/\s\+$//e<CR>]])

-- Disable visual mode
map.set('', 'Q', '<nop>', { remap = true })

-- Disable arrow keys
map.set('', '<up>', '<nop>', { remap = true })
map.set('', '<down>', '<nop>', { remap = true })
map.set('', '<left>', '<nop>', { remap = true })
map.set('', '<right>', '<nop>', { remap = true })

-- Quickfix
map.set('n', '<leader>n', ':cnext<cr>')
map.set('n', '<leader>r', ':cprevious<cr>')

-- Copy current file path to clipboard
map.set('n', ',cs', ':let @+=expand("%")<cr>', { remap = true })
map.set('n', ',cl', ':let @+=expand("%:p")<cr>', { remap = true })

local help_on_current_word = function()
  return vim.cmd('help ' .. vim.fn.expand('<cword>'))
end

-- Search current word on help
map.set('n', ',he', help_on_current_word)

local search_current_word = function()
  return vim.cmd('Ag ' .. vim.fn.expand('<cword>') .. '<cr>')
end

-- Search for word under cursor using Ag
map.set('n', '<leader>ag', search_current_word)

-- Global folding
map.set('n', '<leader>z', ':Fold<cr>')

-- Workspace search
local workspace = require('workspace')
map.set('n', ',wa', workspace.add_dir)
map.set('n', ',wr', workspace.remove_dir)
map.set('n', ',wf', workspace.find_files)
map.set('n', ',wl', function () return P(workspace.list_dirs()) end)
map.set('n', ',wg', workspace.grep_files)
map.set('n', ',wc', workspace.clean_dirs)
