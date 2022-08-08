local map = vim.keymap

-- Leader
-- map.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable visual mode
map.set('', 'Q', '<nop>', { remap = true })

-- Disable arrow keys
map.set('', '<up>', '<nop>', { remap = true })
map.set('', '<down>', '<nop>', { remap = true })
map.set('', '<left>', '<nop>', { remap = true })
map.set('', '<right>', '<nop>', { remap = true })

-- Copy current file path to clipboard
map.set('n', ',cs', ':let @+=expand("%")<cr>', { remap = true })
map.set('n', ',cl', ':let @+=expand("%:p")<cr>', { remap = true })
