" -------------------------------------------------------------------
" Plugins handler
" -------------------------------------------------------------------

call plug#begin('~/.vim/bundle')

" Manipulate files
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
Plug 'tpope/vim-surround'
Plug 'henrik/vim-indexed-search'

" Searchs
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'francoiscabrol/ranger.vim', { 'on': 'Ranger' }

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'

" Completion
Plug 'Shougo/neocomplete.vim'
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'

" Layout
Plug 'mhinz/vim-startify', { 'on': ['SSave', 'SLoad', 'Startitfy'] }
Plug 'itchyny/lightline.vim'

" Syntax
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'

" Color themes
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" -------------------------------------------------------------------
" General
" -------------------------------------------------------------------

set nocompatible
set encoding=utf-8
set more
set ttyfast
set lazyredraw

" === Leader ===
let g:mapleader = "\<Space>"

" " === Filetype ===
syntax on                  " Add syntax highlight
filetype plugin indent on  " Enable plugin to filetype of file

" === Config ===
set mouse=a         " Enable select with mouse on supported modes
set showcmd         " Show incomplete commands
set laststatus=2    " Aways display status line
set updatetime=250  " Change update time of files to 250ms
set showmatch       " Show matcher when above cursor
set number          " Show line number
set ruler           " Show ruler
set colorcolumn=120 " Add delimitation line on 120 character
set nowrap          " Don't wrap lines
set linebreak       " Wrap lines at convenient points
set wildmenu        " Add menu with options and cycle through tab

" === Indentation ===
set autoindent    " Enable automatic indentation"
set backspace=2   " Delete 2 spaces
set shiftwidth=2  " Column space on identation << or >>
set tabstop=2     " Default tab space to 2 on tabs
set softtabstop=2 " Default tab space to 2 on spaces
set expandtab     " Convert tabs to spaces
set smartindent   " Automatically inserts one extra level of indentation
set smarttab      " Insert indentation according to shiftwidth
set shiftround    " Calculate shiftwidth based on line start

" " === Colos configuration ===
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:solarized_termcolors=256 " Set 256 solarized colors
set termguicolors              " Use true color on vim
set background=dark            " Set default backgroud to dark
colorscheme onedark

" === Turn off swap files ===
set noswapfile    " Disable create of swap file
set nobackup      " Disable backup
set nowritebackup " Disable backup before write

" === Keep undo history across sessions, by storing in file ===
call system('mkdir -p ~/.vim/undo')
set undofile
set undodir=~/.vim/undo

" === Scrolling ===
set scrolloff=8      " Start scrolling when we're 8 lines away from margins
set sidescrolloff=8
set sidescroll=1

" === Automatic change on files ===
set autowrite " Enable automatically :write before running commands
set autoread  " Reload files changed outside vim

" === Search ===
set incsearch  " Find the next match as we type the search
set nohlsearch " Do not highlight searches by default
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type a capital

" === Abbreviations ===
iabbr pry binding.pry
iabbr dbg debugger
iabbr log console.log

" === Open new split panes to right and bottom ===
set splitbelow
set splitright

" === Better handle timeout(need more work) ===
set timeoutlen=1000 ttimeoutlen=0

" -------------------------------------------------------------------
" Keymaps
" -------------------------------------------------------------------

" === Handle save ===
nnoremap <leader>w :w!<cr>
nnoremap <leader>x :x!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>z :qa<cr>

" === Buffer movements ===
nnoremap <leader>; :bd<cr>
nnoremap <leader>h :bprev<cr>
nnoremap <leader>l :bnext<cr>
nnoremap <C-B> :%bd<CR>

" === Split movements ===
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" === Clipboard ===
nnoremap <leader>p "+p
nnoremap <leader>y "+y
vnoremap <leader>y "+y
noremap Y y$

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


" === FZF ===
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <leader>o :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Colors<CR>
nnoremap <leader>a :Ag
nnoremap <leader>e :BLines<CR>

" === Autocomplete-Completor ===
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" === StatusLine ===
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
    \ 'left': [ [ 'mode', 'paste' ], [ 'readonly', 'relativepath', 'modified' ] ]
  \ }
\ }

" === Git Gutter ===
let g:gitgutter_map_keys = 0           " Disable maps
let g:gitgutter_sign_column_always = 1 " Always show sign column

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
nnoremap <leader>j :ALENext<CR>
nnoremap <leader>m :ALELint<CR>

" === Ranger ===
let g:ranger_map_keys = 0
map <leader>f :Ranger<CR>
