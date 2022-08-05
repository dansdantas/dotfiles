local env = vim.env
local g   = vim.g
local map = vim.keymap
local v   = vim.v

-- AnyJump
g.any_jump_disable_default_keybindings = 1
map.set('x', ',aj', ':AnyJumpVisual') -- Visual mode: jump to selected text in visual mode

-- Startitfy
g.startify_session_dir = vim.fn.stdpath('data') .. '/session'
g.startify_disable_at_vimenter = 1

-- FZF
env.FZF_DEFAULT_COMMAND = [[ag --vimgrep --hidden --ignore .git -l --ignore spec/fixtures -g ""]]

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

local build_quickfix_list = function(lines)
  local files = {}

  for _, file in pairs(lines) do
    table.insert(files, { filename = file })
  end

  vim.fn.setqflist(files)
  vim.cmd(':copen')
end

g.fzf_action = {
  ['ctrl-t'] = 'tab split',
  ['ctrl-x'] = 'split',
  ['ctrl-v'] = 'vsplit',
  ['ctrl-q'] = build_quickfix_list,
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

-- Vue
g.used_javascript_libs = 'underscore,vue,jquery'

-- Test
v['test#strategy'] = 'vimux'
g['test#preserve_screen'] = 1
g['test#echo_command'] = 0

-- Motion
g['sneak#s_next'] = 1
g['sneak#label'] = 1

-- Linter
require('lint').linters_by_ft = {
  ruby = { "ruby",  "rubocop" },
  lua = { "luacheck" }
}
