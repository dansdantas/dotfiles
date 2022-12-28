" -------------------------------------------------------------------
" Plugins configurations
" -------------------------------------------------------------------

" === AnyJump ===
let g:any_jump_disable_default_keybindings = 1

" === Startitfy ===
let g:startify_session_dir = '$XDG_DATA_HOME/nvim/session'
let g:startify_disable_at_vimenter = 1

" === FZF ===
let $FZF_DEFAULT_COMMAND = 'ag --vimgrep --hidden --ignore .git -l --ignore spec/fixtures -g ""'

" Center window
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:fzf_colors = {
  \'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
\ }

function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
\ }

" === Deoplete ===
let g:deoplete#enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 5000000

" === StatusLine ===
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'component_expand': {
  \   'linter_checking': 'lightline#ale#checking',
  \   'linter_warnings': 'lightline#ale#warnings',
  \   'linter_errors': 'lightline#ale#errors',
  \   'linter_ok': 'lightline#ale#ok'
  \ },
  \ 'component_function': {
  \   'filetype': 'LightlineFiletype'
  \ },
  \ 'component_type': {
  \   'linter_checking': 'left',
  \   'linter_warnings': 'warning',
  \   'linter_errors': 'error',
  \   'linter_ok': 'left'
  \ },
  \ 'active': {
  \   'right': [
  \     [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
  \     [ 'lineinfo' ],
  \     [ 'filetype']
  \   ]
  \ },
  \ 'inactive': {
  \   'left': [ [ 'relativepath', 'modified' ] ]
  \ },
\ }

function! LightlineFiletype()
  if &filetype ==? 'ruby'
    return ''
  elseif &filetype ==? 'javascript'
    return ''
  endif
  return &filetype
endfunction

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" === Signify ===
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1

" === Python ===
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.18/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.8.5/bin/python'
let g:ycm_server_python_interpreter = $PYENV_ROOT.'/versions/3.8.5/bin/python'

" === Ruby ===
let g:ruby_path = system('echo $RBENV_ROOT/shims')
let g:ruby_host_prog = $RBENV_ROOT.'/shims/ruby'

" === ALE ===
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'

let g:ale_linters = {
\ 'javascript': ['jshint', 'eslint'],
\ 'ruby': ['reek', 'rubocop', 'ruby', 'rails_best_practices']
\}

" === Vue ===
let g:used_javascript_libs = 'underscore,vue,jquery'

" === Test ===
let test#strategy = "vimux"
let g:test#preserve_screen = 1
let g:test#echo_command = 0

" === Motion ===
let g:sneak#s_next = 1
let g:sneak#label = 1

" === CoC ===
" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" === CocSnippets ===

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
