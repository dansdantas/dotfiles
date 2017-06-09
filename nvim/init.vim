" -------------------------------------------------------------------
" Plugins handler
" -------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

" Manipulate files and buffers
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'henrik/vim-indexed-search'
Plug 'schickling/vim-bufonly'

" Search files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'

" Tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Layout
Plug 'mhinz/vim-startify'

" Status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'neomake/neomake'

" Color & Themes
Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

" Rails section
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'

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
colorscheme onedark " Set colorscheme

" === Turn off swap files ===
set noswapfile    " Disable create of swap file
set nobackup      " Disable backup
set nowritebackup " Disable backup before write

" === Scrolling ===
set scrolloff=15     " Start scrolling when we're 15 lines away from margins
set sidescrolloff=15 
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
" Keymaps
" -------------------------------------------------------------------

" === Handle save ===
nnoremap <leader>w :w!<cr>
nnoremap <leader>x :x!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>z :qa<cr>

" === Tab movements ===
nnoremap <leader>h :tabprevious<cr>
nnoremap <leader>l :tabnext<cr>

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

" === NERDTree ===
noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>r :NERDTreeFind<CR>

" === Bufonly ===
nnoremap <C-B> <Esc>:Bufonly<Esc>

" === FZF ===
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
nnoremap <leader>o :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Colors<CR>
nnoremap <leader>a :Ag
nnoremap <leader>e :BLines<CR>

" === Neomake ===
nnoremap <leader>k :lprev<CR>
nnoremap <leader>j :lnext<CR>

" === Deoplete ===
let g:deoplete#enable_at_startup = 1
let g:deoplete#disable_auto_complete = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['buffer', 'tag']
let g:deoplete#tag#cache_limit_size = 5000000
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()

" === Airline ===
let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
let g:airline_theme='base16_monokai'

" === Git Gutter ===
let g:gitgutter_map_keys = 0           " Disable maps
let g:gitgutter_sign_column_always = 1 " Always show sign column

" === Python ===
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.12/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.5.2/bin/python'
let g:ycm_server_python_interpreter = $PYENV_ROOT.'/versions/3.5.2/bin/python'

" === Neomake ===
:augroup neomake
:  autocmd!
:  autocmd! BufWritePost * Neomake
:augroup END
