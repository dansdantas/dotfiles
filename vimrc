execute pathogen#infect()
set nocompatible               " be iMproved, required
set ttyfast
set lazyredraw

" === Leader ==================================================
let mapleader = " "
let g:netrw_liststyle=3        " Use tree style for netrw

" === General Config ==========================================

syntax on                      " Add syntax highlight
filetype plugin indent on      " Enable plugin to filetype of file

set history=50
set enc=utf-8                  " Set default encode
set mouse=a                    " Enable select with mouse on supported modes
set showcmd                    " Show incomplete commands
set laststatus=2               " Aways display status line
set updatetime=250             " Change update time of files to 250ms
set showmatch                  " Show matcher when above cursor

" set relativenumber             " Show relative line number / speed issues
set number                     " Show line number
set numberwidth=4              " Define width to number spaces

" set cursorline                 " Show line cursor mark / speed issues
set ruler                      " Show ruler
set cc=120                     " Add delimitation line on 120 character
set nowrap                     " Don't wrap lines
set linebreak                  " Wrap lines at convenient points

" === Keywords ================================================

set iskeyword-=_
set iskeyword-=-
set iskeyword-=-

" === Indentation =============================================

set ai                         " Enable automatic indentation"
set backspace=2                " Delete 2 spaces
set shiftwidth=2               " Column space on identation << or >>
set tabstop=2                  " Default tab space to 2 on tabs
set softtabstop=2              " Default tab space to 2 on spaces
set expandtab                  " Convert tabs to spaces
set smartindent                " Automatically inserts one extra level of indentation
set smarttab                   " Insert indentation according to shiftwidth
set shiftround                 " Calculate shiftwidth based on line start

" === Colos configuration =====================================

let g:solarized_termcolors=256 " Set 256 solarized colors
set termguicolors              " Use true color on vim
set background=dark            " Set default backgroud to dark
colorscheme onedark

" === Turn off swap files =====================================

set noswapfile                 " Disable create of swap file
set nobackup
set nowritebackup

" === Keep undo history across sessions, by storing in file ===

call system('mkdir -p ~/.vim/undo')
set undofile
set undodir=~/.vim/undo

" === Display tabs and trailing spaces visually ===============

set list listchars=tab:\ \ ,trail:·

" === Folds ===================================================

set foldmethod=indent          " fold based on indent
set foldnestmax=3              " deepest fold is 3 levels
set nofoldenable               " dont fold by default

" === Scrolling ===============================================

set scrolloff=15               " Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" === Automatic change on files ===============================

set autowrite                  " Automatically :write before running commands
set autoread                   " Reload files changed outside vim

" === Search ==================================================

set incsearch                  " Find the next match as we type the search
set nohlsearch                 " Do not highlight searches by default
set ignorecase                 " Ignore case when searching...
set smartcase                  " ...unless we type a capital

" === Treat <li> and <p> tags like the block tags they are ====
let g:html_indent_tags = 'li\|p'

" === Abbreviations ===========================================

iabbr pry binding.pry
iabbr dbg debugger
iabbr log console.log

" === Open new split panes to right and bottom ================
set splitbelow
set splitright

" === Better handle timeout(need more work) ===================

set timeout " Do time out on mappings and others
set timeoutlen=2000 " Wait {num} ms before timing out a mapping

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" === Expand extra files ======================================

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

if filereadable(expand("~/.vimrc.functions"))
  source ~/.vimrc.functions
endif

if filereadable(expand("~/.vimrc.keymaps"))
  source ~/.vimrc.keymaps
endif

" === Simple re-format for minified Javascript ================

command! UnMinify call UnMinify()

" ===  When alter buffs trim white space ======================

autocmd BufWritePre * :%s/\s\+$//e

" === Plugins configurations ==================================

" === Buffergator =============================================

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" === Airline =================================================

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" === RainbowParentheses ======================================

" Auto load better parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
