" -------------------------------------------------------------------
" Plugins handler
" -------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

" Manipulate files and buffers
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch' " UNIX commands
Plug 'markonm/traces.vim' " Preview pattern and replacement in :s
Plug 'vim-scripts/restore_view.vim'

" Search files
Plug 'junegunn/fzf', { 'dir': '$XDG_DATA_HOME/fzf', 'do': './install --xdg --no-update-rc' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-abolish' " Search and replace subvert pattern

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'

" CoC
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'tpope/vim-endwise'

" Completion
Plug 'Valloric/MatchTagAlways'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Layout && Status
Plug 'mhinz/vim-startify', { 'on': ['SSave', 'SLoad', 'Startitfy'] }
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'tmux-plugins/vim-tmux-focus-events' " Restore vim events inside tmux

" Syntax
Plug 'editorconfig/editorconfig-vim'
Plug 'tomtom/tcomment_vim'
Plug 'dense-analysis/ale'

" Highlighting
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'digitaltoad/vim-pug'
Plug 'slim-template/vim-slim'
Plug 'iloginow/vim-stylus'
Plug 'mxw/vim-jsx'
Plug 'M4R7iNP/vim-inky'

" Color & Themes
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'taigacute/gruvbox9'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'drewtempelmeyer/palenight.vim'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fubitive'
Plug 'sodapopcan/vim-twiggy'

" Html
Plug 'mattn/emmet-vim'
Plug 'tmhedberg/matchit'

" Ruby & Rails
Plug 'janko-m/vim-test'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'
Plug 'benmills/vimux'

call plug#end()

" -------------------------------------------------------------------
" General
" -------------------------------------------------------------------

" === Leader ===
let g:mapleader = "\<Space>"

" === Config ===
set encoding=utf-8  " Set encoding
set noshowmode      " Disable warning if changes modes on status line
set noshowcmd       " Does not show incomplete commands
set showmatch       " Show matcher when above cursor
set number          " Show line number
set colorcolumn=120 " Add delimitation line on 120 character
set splitbelow      " Split below on new split
set splitright      " Split right on new split
set autowrite       " Enable automatically :write before running commands
set hidden
set signcolumn=yes  " Always show the signcolumn

" === Indentation ===
set shiftwidth=2  " Column space on identation << or >>
set tabstop=2     " Default tab space to 2 on tabs
set softtabstop=2 " Default tab space to 2 on spaces
set expandtab     " Convert tabs to spaces
set smartindent   " Automatically inserts one extra level of indentation
set shiftround    " Calculate shiftwidth based on line start

" === Colors configuration ===
let g:onedark_terminal_italics = 1
let g:onedark_hide_endofbuffer = 1
set termguicolors     " Enable true color
set background=dark   " Force dark background
colorscheme onedark " Set colorscheme

" === Turn off swap files ===
set noswapfile    " Disable create of swap file
set nobackup      " Disable backup
set nowritebackup " Disable backup before write

" === Scrolling ===
set scrolloff=8     " Start scrolling when we're 15 lines away from margins
set sidescrolloff=8
set sidescroll=1

" === Search ===
set nohlsearch " Do not highlight searches by default
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type a capital

" === Abbreviations ===
iabbr pry binding.pry
iabbr dbg debugger
iabbr log console.log
abbr todo: <esc>:call AddToDo()<cr>

" === Keep undo history across sessions, by storing in file ===
call system('mkdir -p ~/.config/nvim/undo')
set undofile
set undodir=~/.config/nvim/undo

" === Folding ===
set foldmethod=manual
set foldlevel=9999

" -------------------------------------------------------------------
" File extensions
" -------------------------------------------------------------------
autocmd BufRead,BufNewFile *.arb setfiletype ruby

" -------------------------------------------------------------------
" Keymaps
" -------------------------------------------------------------------

" === Handle save ===
nnoremap <leader>w :w!<cr>
nnoremap <leader>x :x!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>z :qa<cr>

" === Tab & Buffer movements ===
nnoremap <leader>j :tabprevious<cr>
nnoremap <leader>k :tabnext<cr>
nnoremap <leader>; :bd!<cr>
nnoremap <leader>h :bprev<cr>
nnoremap <leader>l :bnext<cr>

" === Split ===
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" === Moviments ===
nnoremap ;; $
nnoremap B ^
nnoremap E $

" === Clipboard ===
nnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y
noremap Y y$

" === Buffers ===
nnoremap <C-B> :%bd!<CR>

" === Remove white spaces ===
nnoremap <Leader><BS> :%s/\s\+$//e<CR>

" === Disable visual mode
map Q <nop>

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Quickfix
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>r :cprevious<CR>

" Copy current file path to clipboard
nmap ,cs :let @+=expand("%")<CR>
nmap ,cl :let @+=expand("%:p")<CR>

" Search current word on help
nmap ,he "zyiw:exe "h ".@z.""<CR>

" Search for word under cursor using Ag
nmap <Leader>ag "zyiw:exe "Ag ".@z.""<CR>

" Global folding
nnoremap <Leader>z :call FoldingToggleFold()<cr>

" -------------------------------------------------------------------
" Plugins configurations
" -------------------------------------------------------------------

" === Gundo ===
nnoremap <leader>u :UndotreeToggle<CR>

" === Startitfy ===
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_disable_at_vimenter = 1
nnoremap <leader>s :SSave<CR>
nnoremap <leader>S :SLoad<space>

" === FZF ===
let $FZF_DEFAULT_COMMAND = 'ag --vimgrep --hidden --ignore .git -l -g ""'
nnoremap <leader>o :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>aa :Ag<Space>
nnoremap <leader>e :BLines<CR>
nnoremap <leader>i :Commands<CR>

let g:fzf_layout = { 'down': '~30%' }
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
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.15/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.6.3/bin/python'
let g:ycm_server_python_interpreter = $PYENV_ROOT.'/versions/3.6.3/bin/python'

" === Ruby ===
let g:ruby_path = system('echo $RBENV_ROOT/shims')
let g:ruby_host_prog = $RBENV_ROOT.'/shims/ruby'

" === ALE ===
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_lint_on_enter = 0

let g:ale_linters = {
\ 'javascript': ['jshint', 'eslint'],
\ 'ruby': ['reek', 'rubocop', 'ruby', 'rails_best_practices']
\}

nnoremap <leader>ak :ALEPrevious<CR>
nnoremap <leader>aK :ALEPreviousWrap<CR>
nnoremap <leader>aj :ALENext<CR>
nnoremap <leader>aJ :ALENextWrap<CR>
nnoremap <leader>al :ALELint<CR>
nnoremap <leader>at :ALEToggle<CR>

" === File manager ===
nnoremap <leader>F :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" === Vue ===
autocmd FileType vue syntax sync fromstart
let g:used_javascript_libs = 'underscore,vue,jquery'

" === Test ===
let test#strategy = "vimux"
let g:test#preserve_screen = 1
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tg :TestVisit<CR>
nnoremap <leader>tw :TestLastOnlyFail<CR>

" === Motion ===
let g:sneak#s_next = 1
let g:sneak#label = 1

" === CoC ===
" Give more space for displaying messages.
" set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
" set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap ,f  <Plug>(coc-format-selected)
nmap ,f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap ,as  <Plug>(coc-codeaction-selected)
nmap ,as  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap ,ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
" nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
nmap ,f :Format<cr>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" == CoCList ===

" Show all diagnostics.
nnoremap <silent> ,d  :<C-u>CocList diagnostics<cr>

" Manage extensions.
nnoremap <silent> ,e  :<C-u>CocList extensions<cr>

" Show commands.
nnoremap <silent> ,co  :<C-u>CocList commands<cr>

" Find symbol of current document.
nnoremap <silent> ,o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> ,s  :<C-u>CocList -I symbols<cr>

" Do default action for next item.
nnoremap <silent> ,j  :<C-u>CocNext<CR>

" Do default action for previous item.
nnoremap <silent> ,k  :<C-u>CocPrev<CR>

" Resume latest coc list.
nnoremap <silent> ,p  :<C-u>CocListResume<CR>

" === CocSnippets ===
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" -------------------------------------------------------------------
" Functions
" -------------------------------------------------------------------

function! AddToDo()
    let branch_name = system('printf $(git rev-parse --abbrev-ref HEAD)')
    execute 'normal! i @todo '.branch_name.' -'
    startinsert!
endfunction

""" folding
function! FoldingToggleFold()
   if foldlevel('.') == 0
      " No fold exists at the current line,
      " so create a fold based on indentation

      let l_min = line('.')   " the current line number
      let l_max = line('$')   " the last line number
      let i_min = indent('.') " the indentation of the current line
      let l = l_min + 1

      " Search downward for the last line whose indentation > i_min
      while l <= l_max
         " if this line is not blank ...
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            if indent(l) <= i_min

               " we've gone too far
               let l = l - 1    " backtrack one line
               break
            endif
         endif
         let l = l + 1
      endwhile

      " Clamp l to the last line
      if l > l_max
         let l = l_max
      endif

      " Backtrack to the last non-blank line
      while l > l_min
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            break
         endif
         let l = l - 1
      endwhile

      "execute "normal i" . l_min . "," . l . " fold"   " print debug info

      if l > l_min
         " Create the fold from l_min to l
         execute l_min . "," . l . " fold"
      endif
   else
      " Delete the fold on the current line
      normal zd
   endif
endfunction
