" -------------------------------------------------------------------
" Plugins handler
" -------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

" Manipulate files and buffers
Plug 'mbbill/undotree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'henrik/vim-indexed-search'
Plug 'schickling/vim-bufonly'

" Search files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Productivity
Plug 'wakatime/vim-wakatime'

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'

" Completion
Plug 'Valloric/YouCompleteMe'
Plug 'Valloric/MatchTagAlways'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'

" Tree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Layout
Plug 'mhinz/vim-startify'

" Status
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Syntax
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'

" Syntax color
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'slim-template/vim-slim'
Plug 'ap/vim-css-color'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'othree/javascript-libraries-syntax.vim'

" Color themes
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'sickill/vim-monokai'
Plug 'MaxSt/FlatColor'
Plug 'trusktr/seti.vim'

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
let mapleader = "\<Space>"

" === Config ===
set showcmd    " Show incomplete commands
set showmatch  " Show matcher when above cursor
set number     " Show line number
set cc=120     " Add delimitation line on 120 character
set splitbelow " Split below on new split
set splitright " Split right on new split
set autowrite  " Enable automatically :write before running commands

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
set nohls      " Do not highlight searches by default
set ignorecase " Ignore case when searching...
set smartcase  " ...unless we type a capital

" === Abbreviations ===
iabbr pry binding.pry
iabbr dbg debugger
iabbr log console.log

" === Handle create file without directory ===
function s:MkNonExDir(file, buf)
  if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
    let dir=fnamemodify(a:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
endfunction

augroup BWCCreateDir
  autocmd!
  autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

" === Set local cursor line ===
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

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

" === Toggle gundo ===
nnoremap <leader>u :UndotreeToggle<CR>

" === Save session ===
nnoremap <leader>s :SSave<CR>

" === Toggle NERDTree ===
noremap <leader>t :NERDTreeToggle<CR>

" === Bufonly ===
nnoremap <C-B> <Esc>:Bufonly<Esc>

" === FZF ===
nnoremap <leader>o :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Colors<CR>
nnoremap <leader>a :Ag
nnoremap <leader>e :BLines<CR>

" -------------------------------------------------------------------
" Plugins configurations
" -------------------------------------------------------------------

" === Syntax ===
let g:used_javascript_libs = 'jquery,underscore,angularjs,react'

" === Airline ===
let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" === Disable git gutter maps ===
let g:gitgutter_map_keys = 0

" === FZF ===
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

" === Python ===
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.12/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.5.2/bin/python'
let g:ycm_server_python_interpreter = $PYENV_ROOT.'/versions/3.5.2/bin/python'

" === Startify ===
let g:startify_session_dir = '~/.config/nvim/session'
let g:ruby_path = system('echo $RBENV_ROOT/shims')
