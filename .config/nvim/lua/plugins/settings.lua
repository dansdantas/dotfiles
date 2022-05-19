local env = vim.env
local g   = vim.g
local map = vim.keymap
local v   = vim.v

-- AnyJump
g.any_jump_disable_default_keybindings = 1

map.set('n', ',aj', ':AnyJump<cr>') -- Normal mode: Jump to definition under cursore
map.set('x', ',aj', ':AnyJumpVisual') -- Visual mode: jump to selected text in visual mode
map.set('n', ',ab', ':AnyJumpBack<cr>') -- Normal mode: open previous opened file (after jump)
map.set('n', ',al', ':AnyJumpLastResults<cr>') -- " Normal mode: open last closed search window again

-- Startitfy
g.startify_session_dir = env.XDG_DATA_HOME .. '/nvim/session'
g.startify_disable_at_vimenter = 1
map.set('n', '<leader>ss', ':SSave<cr>')
map.set('n', '<leader>S', ':SLoad ')

-- FZF
env.FZF_DEFAULT_COMMAND = [[ag --vimgrep --hidden --ignore .git -l --ignore spec/fixtures -g ""]]

map.set('n', '<leader>o', ':FZF<cr>')
map.set('n', '<leader>b', ':Buffers<cr>')
map.set('n', '<leader>c', ':Commits<cr>')
map.set('n', '<leader>aa', ':Ag<Space>')
map.set('n', '<leader>e', ':BLines<cr>')
map.set('n', '<leader>i', ':Commands<cr>')

-- Center window
g.fzf_layout = { down = '40%', window = { width = 0.9, height = 0.6 } }

g.fzf_colors = {
  fg = { 'fg', 'Normal' },
  bg = { 'bg', 'Normal' },
  hl = { 'fg', 'Comment' },
  info = { 'fg', 'PreProc' },
  border = { 'fg', 'Ignore' },
  prompt = { 'fg', 'Conditional' },
  pointer = { 'fg', 'Exception' },
  marker = { 'fg', 'Keyword' },
  spinner = { 'fg', 'Label' },
  header = { 'fg', 'Comment' },
  ['fg+'] = { 'fg', 'CursorLine', 'CursorColumn', 'Normal' },
  ['bg+'] = { 'bg', 'CursorLine', 'CursorColumn' },
  ['hl+'] = { 'fg', 'Statement' },
}

-- function! s:build_quickfix_list(lines)
--   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
--   copen
--   cc
-- endfunction
-- 'ctrl-q': function('s:build_quickfix_list'),

g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit',
}

-- Python
g.python_host_prog = env.PYENV_ROOT .. '/versions/2.7.18/bin/python'
g.python3_host_prog = env.PYENV_ROOT .. '/versions/3.8.5/bin/python'
g.ycm_server_python_interpreter = env.PYENV_ROOT .. '/versions/3.8.5/bin/python'

-- Ruby
g.loaded_ruby_provider = 0
g.ruby_path = env.RBENV_ROOT .. '/shims'
g.ruby_host_prog = env.RBENV_ROOT .. '/shims/ruby'

-- ALE
g.ale_completion_enabled = 1
g.ale_sign_column_always = 1
g.ale_echo_msg_format = '[%linter%] %s'
g.ale_sign_error = '•'
g.ale_sign_warning = '•'
g.ale_linters = {
  javascript = { 'jshint', 'eslint' },
  ruby = { 'reek', 'rubocop', 'ruby', 'rails_best_practices' }
}

map.set('n', '<leader>ak', ':ALEPrevious<cr>')
map.set('n', '<leader>aK', ':ALEPreviousWrap<cr>')
map.set('n', '<leader>aj', ':ALENext<cr>')
map.set('n', '<leader>aJ', ':ALENextWrap<cr>')
map.set('n', '<leader>al', ':ALELint<cr>')
map.set('n', '<leader>at', ':ALEToggle<cr>')

-- File manager
map.set('n', '<leader>F', ':NERDTreeToggle<cr>')
map.set('n', '<leader>f', ':NERDTreeFind<cr>')

-- Vue
g.used_javascript_libs = 'underscore,vue,jquery'

-- Test
v['test#strategy'] = 'vimux'
g['test#preserve_screen'] = 1
g['test#echo_command'] = 0

map.set('n', '<leader>tn', ':TestNearest<cr>')
map.set('n', '<leader>tf', ':TestFile<cr>')
map.set('n', '<leader>ts', ':TestSuite<cr>')
map.set('n', '<leader>tl', ':TestLast<cr>')
map.set('n', '<leader>tv', ':TestVisit<cr>')
map.set('n', '<leader>tw', ':TestLastOnlyFail<cr>')

-- Motion
g['sneak#s_next'] = 1
g['sneak#label'] = 1

-- Maximize
map.set('n', '<leader>mt', ':MaximizerToggle<cr>')
