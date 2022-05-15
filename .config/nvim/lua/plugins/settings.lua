local api = vim.api
local env = vim.env
local g   = vim.g
local map = vim.keymap
local v   = vim.v

-- " === AnyJump ===
-- let g:any_jump_disable_default_keybindings = 1
--
-- " Normal mode: Jump to definition under cursore
-- nnoremap ,aj :AnyJump<CR>
--
-- " Visual mode: jump to selected text in visual mode
-- xnoremap ,aj :AnyJumpVisual<CR>
--
-- " Normal mode: open previous opened file (after jump)
-- nnoremap ,ab :AnyJumpBack<CR>
--
-- " Normal mode: open last closed search window again
-- nnoremap ,al :AnyJumpLastResults<CR>
--
-- " === Startitfy ===
-- let g:startify_session_dir = '$XDG_DATA_HOME/nvim/session'
-- let g:startify_disable_at_vimenter = 1
-- nnoremap <leader>s :SSave<CR>
-- nnoremap <leader>S :SLoad<space>
--
-- " === FZF ===
-- let $FZF_DEFAULT_COMMAND = 'ag --vimgrep --hidden --ignore .git -l --ignore spec/fixtures -g ""'
--
-- nnoremap <leader>o :FZF<CR>
-- nnoremap <leader>b :Buffers<CR>
-- nnoremap <leader>c :Commits<CR>
-- nnoremap <leader>aa :Ag<Space>
-- nnoremap <leader>e :BLines<CR>
-- nnoremap <leader>i :Commands<CR>
--
-- " Center window
-- let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
--
-- let g:fzf_colors = {
--   \'fg':      ['fg', 'Normal'],
--   \ 'bg':      ['bg', 'Normal'],
--   \ 'hl':      ['fg', 'Comment'],
--   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
--   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
--   \ 'hl+':     ['fg', 'Statement'],
--   \ 'info':    ['fg', 'PreProc'],
--   \ 'border':  ['fg', 'Ignore'],
--   \ 'prompt':  ['fg', 'Conditional'],
--   \ 'pointer': ['fg', 'Exception'],
--   \ 'marker':  ['fg', 'Keyword'],
--   \ 'spinner': ['fg', 'Label'],
--   \ 'header':  ['fg', 'Comment']
-- \ }
--
-- function! s:build_quickfix_list(lines)
--   call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
--   copen
--   cc
-- endfunction
--
-- let g:fzf_action = {
--   \ 'ctrl-q': function('s:build_quickfix_list'),
--   \ 'ctrl-t': 'tab split',
--   \ 'ctrl-x': 'split',
--   \ 'ctrl-v': 'vsplit'
-- \ }
--
-- " === Deoplete ===
-- let g:deoplete#enable_at_startup = 1
-- let g:deoplete#tag#cache_limit_size = 5000000
-- inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
-- inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
--
-- " === StatusLine ===
-- let g:lightline = {
--   \ 'colorscheme': 'onedark',
--   \ 'component_expand': {
--   \   'linter_checking': 'lightline#ale#checking',
--   \   'linter_warnings': 'lightline#ale#warnings',
--   \   'linter_errors': 'lightline#ale#errors',
--   \   'linter_ok': 'lightline#ale#ok'
--   \ },
--   \ 'component_function': {
--   \   'filetype': 'LightlineFiletype'
--   \ },
--   \ 'component_type': {
--   \   'linter_checking': 'left',
--   \   'linter_warnings': 'warning',
--   \   'linter_errors': 'error',
--   \   'linter_ok': 'left'
--   \ },
--   \ 'active': {
--   \   'right': [
--   \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
--   \     [ 'lineinfo' ],
--   \     [ 'filetype']
--   \   ]
--   \ },
--   \ 'inactive': {
--   \   'left': [ [ 'relativepath', 'modified' ] ]
--   \ },
-- \ }
--
-- function! LightlineFiletype()
--   if &filetype ==? 'ruby'
--     return ''
--   elseif &filetype ==? 'javascript'
--     return ''
--   endif
--   return &filetype
-- endfunction
--
-- let g:lightline#ale#indicator_checking = "\uf110"
-- let g:lightline#ale#indicator_warnings = "\uf071"
-- let g:lightline#ale#indicator_errors = "\uf05e"
-- let g:lightline#ale#indicator_ok = "\uf00c"

-- " === Signify ===
g.signify_vcs_list = {'git'}
g.signify_realtime = 1

-- Python
g.python_host_prog = env.PYENV_ROOT..'/versions/2.7.18/bin/python'
g.python3_host_prog = env.PYENV_ROOT..'/versions/3.8.5/bin/python'
g.ycm_server_python_interpreter = env.PYENV_ROOT..'/versions/3.8.5/bin/python'

-- Ruby
g.ruby_path = env.RBENV_ROOT..'/shims'
g.ruby_host_prog = env.RBENV_ROOT..'/shims/ruby'

-- ALE
g.ale_completion_enabled = 1
g.ale_sign_column_always = 1
g.ale_echo_msg_format = '[%linter%] %s'
g.ale_sign_error = '•'
g.ale_sign_warning = '•'
g.ale_linters = { 
  javascript = {'jshint', 'eslint'},
  ruby = {'reek', 'rubocop', 'ruby', 'rails_best_practices'}
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
api.nvim_create_autocmd('FileType vue', { command = 'syntax sync fromstart' })
g.used_javascript_libs = 'underscore,vue,jquery'

-- Test 
v['test#strategy'] = 'vimux'
g['test#preserve_screen'] = 1
g['test#echo_command'] = 0

map.set('n', '<leader>tn', ':TestNearest<cr>')
map.set('n', '<leader>tf', ':TestFile<cr>')
map.set('n', '<leader>ts', ':TestSuite<cr>')
map.set('n', '<leader>tl', ':TestLast<cr>')
map.set('n', '<leader>tg', ':TestVisit<cr>')
map.set('n', '<leader>tw', ':TestLastOnlyFail<cr>')

-- Motion
g['sneak#s_next'] = 1
g['sneak#label'] = 1

-- Telescope
map.set('n', '<leader>to', function() require('telescope.builtin').find_files() end)
map.set('n', '<leader>tb', function() require('telescope.builtin').buffers() end)
map.set('n', '<leader>td', function() require('plugins.telescope').search_dotfiles() end)

-- Maximize
map.set('n', '<leader>mt', 'MaximizerToggle<cr>')
