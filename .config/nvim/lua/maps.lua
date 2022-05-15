local map = vim.keymap

-- Leader
vim.g.mapleader = ' '

map.set('n', '+', '<C-a>')
map.set('n', '-', '<C-x>')

-- reload config
map.set('n', '<leader><cr>', ':so ~/.config/nvim/init.vim<CR>')

-- Handle save
map.set('n', '<leader>w', ':w!<cr>')
map.set('n', '<leader>x', ':x!<cr>')
map.set('n', '<leader>q', ':q<cr>')
map.set('n', '<leader>z', ':qa<cr>')

-- Tab & Buffer movements
map.set('n', '<leader>j', ':tabprevious<cr>')
map.set('n', '<leader>k', ':tabnext<cr>')
map.set('n', '<leader>;', ':bd!<cr>')
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
map.set({'n', 'v'}, '<leader>y', '"+y')
map.set('n', 'Y', 'y$')

-- Buffers
map.set('n', '<C-B>', ':%bd!<cr>')

-- Remove white space
-- map.set('n', '<leader><bs>', ':%s/\s\+$//e<CR>')

-- Disable visual mode
map.set('', 'Q', '<nop>', {remap = true})

-- Disable arrow keys
map.set('', '<up>',    '<nop>', {remap = true})
map.set('', '<down>',  '<nop>', {remap = true})
map.set('', '<left>',  '<nop>', {remap = true})
map.set('', '<right>', '<nop>', {remap = true})

-- Quickfix
map.set('n', '<leader>n', ':cnext<cr>')
map.set('n', '<leader>r', ':cprevious<cr>')

-- Copy current file path to clipboard
map.set('n', ',cs', ':let @+=expand("%")<cr>',   {remap = true})
map.set('n', ',cl', ':let @+=expand("%:p")<cr>', {remap = true})

-- Search current word on help
-- map.set('n', ',he', 'zyiw:exe "h ".@z."<cr>')

---- Search for word under cursor using Ag
--nmap <Leader>ag "zyiw:exe "Ag ".@z.""<CR>

-- Global folding
-- set.map('n', '<leader>z', ':call FoldingToggleFold()<cr>')
