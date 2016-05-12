execute pathogen#infect()
set nocompatible               " be iMproved, required
set ttyfast
set lazyredraw

" === Leader ==================================================
let mapleader = ","

" === General Config ==========================================

syntax on                      " Add syntax highlight
filetype plugin indent on      " Enable plugin to filetype of file

set history=50
set enc=utf-8                  " Set default encode
set mouse=a                    " Enable select with mouse on supported modes
set showcmd                    " Show incomplete commands
set laststatus=2               " Aways display status line
set updatetime=250             " Change update time of files to 250ms
let g:netrw_liststyle=3        " Use tree style for netrw

set number                     " Show line number
set numberwidth=4              " Define width to number spaces

set ruler                      " Show ruler
set cursorline                 " Show line cursor mark
set cc=120                     " Add delimitation line on 120 character
set nowrap                     " Don't wrap lines
set linebreak                  " Wrap lines at convenient points

" === Indentation =============================================

set autoindent                 " Enable automatic indentation"
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
set t_Co=256                   " Use on vim 256 colors
set background=dark            " Set default backgroud to dark
colorscheme monokain

hi Normal ctermbg=none
hi NonText ctermbg=none

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

" === Highlight characters after divisor on 120 column ========

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

" === Folds ===================================================

set foldmethod=indent          "fold based on indent
set foldnestmax=3              "deepest fold is 3 levels
set nofoldenable               "dont fold by default

" === Scrolling ===============================================

set scrolloff=8                "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" === Automatic change on files ===============================

set autowrite                  " Automatically :write before running commands
set autoread                   " Reload files changed outside vim
" set autochdir                  " Set current directory to be the same as the current file

" === Search ==================================================

set incsearch                  " Find the next match as we type the search
set nohlsearch                " Highlight searches by default
set ignorecase                 " Ignore case when searching...
set smartcase                  " ...unless we type a capital

" === The Silver Searcher =====================================
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ===============  Automatically toggle paste mode ============
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

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

match ErrorMsg '\s\+$'

" === Simple re-format for minified Javascript ================

command! UnMinify call UnMinify()

" ===  When alter buffs trim white space ======================

autocmd BufWritePre * :%s/\s\+$//e

" === Abbreviations ===========================================

iabbr pry binding.pry
iabbr dbg debugger

" === Open new split panes to right and bottom ================
set splitbelow
set splitright

" === Plugins configurations ==================================
"
" === CtrlP ===================================================

" Show hidden files on ctrlp.vim
let g:ctrlp_show_hidden = 1
let g:ctrlp_dotfiles = 1

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Auto load better parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
