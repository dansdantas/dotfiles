" -------------------------------------------------------------------
" Plugins handler
" -------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

" Manipulate files and buffers
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tpope/vim-surround'
Plug 'henrik/vim-indexed-search'

" Search files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim', { 'on': 'Ranger' }

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'

" Layout && Status
Plug 'mhinz/vim-startify', { 'on': ['SSave', 'SLoad', 'Startitfy'] }
Plug 'itchyny/lightline.vim'

" Syntax
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'

" Color & Themes
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
" Plug 'posva/vim-vue'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" -------------------------------------------------------------------
" General
" -------------------------------------------------------------------

" === Leader ===
let g:mapleader = "\<Space>"

" === Config ===
set showcmd         " Show incomplete commands
set showmatch       " Show matcher when above cursor
set number          " Show line number
set colorcolumn=120 " Add delimitation line on 120 character
set splitbelow      " Split below on new split
set splitright      " Split right on new split
set autowrite       " Enable automatically :write before running commands
set hidden

" === Indentation ===
set shiftwidth=2  " Column space on identation << or >>
set tabstop=2     " Default tab space to 2 on tabs
set softtabstop=2 " Default tab space to 2 on spaces
set expandtab     " Convert tabs to spaces
set smartindent   " Automatically inserts one extra level of indentation
set shiftround    " Calculate shiftwidth based on line start

" === Colors configuration ===
set termguicolors   " Enable true color
set background=dark " Force dark background
let g:one_allow_italics = 1 " Italics on one theme
colorscheme one " Set colorscheme

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

" === Keep undo history across sessions, by storing in file ===
call system('mkdir -p ~/.config/nvim/undo')
set undofile
set undodir=~/.config/nvim/undo

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
nnoremap <leader>H :tabprevious<cr>
nnoremap <leader>L :tabnext<cr>
nnoremap <leader>; :bd!<cr>
nnoremap <leader>h :bprev<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <leader>t :enew<cr>

" === Split ===
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" === Moviments ===
nnoremap ;; $
nnoremap , `
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

" -------------------------------------------------------------------
" Plugins configurations
" -------------------------------------------------------------------

" === Gundo ===
nnoremap <leader>u :UndotreeToggle<CR>

" === Startitfy ===
let g:startify_session_dir = '~/.config/nvim/session'
let g:ruby_path = system('echo $RBENV_ROOT/shims')
let g:startify_disable_at_vimenter = 1
nnoremap <leader>s :SSave<CR>
nnoremap <leader>S :SLoad<space>

" === FZF ===
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <leader>o :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>a :Ag
nnoremap <leader>e :BLines<CR>
nnoremap <leader>i :Commands<CR>

" === Deoplete ===
let g:deoplete#enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 5000000
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" === StatusLine ===
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
    \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
  \ }
\ }

" === Git Gutter ===
let g:gitgutter_map_keys = 0 " Disable maps
set signcolumn=yes

" === Python ===
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.12/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.5.2/bin/python'
let g:ycm_server_python_interpreter = $PYENV_ROOT.'/versions/3.5.2/bin/python'

" === ALE ===
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'ruby': ['reek', 'rubocop', 'ruby']
\}
nnoremap <leader>k :ALEPrevious<CR>
nnoremap <leader>K :ALEPreviousWrap<CR>
nnoremap <leader>j :ALENext<CR>
nnoremap <leader>J :ALENextWrap<CR>
nnoremap <leader>m :ALELint<CR>

" === Ranger ===
let g:ranger_map_keys = 0
map <leader>f :Ranger<CR>
