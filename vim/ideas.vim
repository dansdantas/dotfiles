" " Plug 'chriskempson/vim-tomorrow-theme'
" " Plug 'morhetz/gruvbox'
" " Plug 'tomasr/molokai'
" " Plug 'sickill/vim-monokai'
" " Plug 'MaxSt/FlatColor'
" " Plug 'trusktr/seti.vim'
" " Plug 'ayu-theme/ayu-vim'
" " Plug 'whatyouhide/vim-gotham'
" " Plug 'tyrannicaltoucan/vim-quantum'
" " Plug 'tyrannicaltoucan/vim-deep-space'
" " Plug 'KeitaNakamura/neodark.vim'
" " Plug 'mhartington/oceanic-next'
" " Plug 'MaxSt/FlatColor'
" " Plug 'iCyMind/NeoSolarized'
" " Plug 'google/vim-colorscheme-primary'
" " Plug 'junegunn/rainbow_parentheses.vim'
" " Plug 'slim-template/vim-slim'
" " Plug 'ap/vim-css-color'
" " Plug 'hail2u/vim-css3-syntax'
" " Plug 'cakebaker/scss-syntax.vim'
" " Plug 'vim-ruby/vim-ruby'
" " Plug 'othree/javascript-libraries-syntax.vim'
" Plug 'Valloric/YouCompleteMe'
" Plug 'w0rp/ale'
" Plug 'w0rp/ale'

" === ALE ===
" let g:ale_sign_column_always = 1
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
" nnoremap <leader>k :ALEPrevious<CR>
" nnoremap <leader>j :ALENext<CR>
"
" " Test area
" " === Handle create file without directory ===
" function s:MkNonExDir(file, buf)
"   if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
"     let dir=fnamemodify(a:file, ':h')
"     if !isdirectory(dir)
"       call mkdir(dir, 'p')
"     endif
"   endif
" endfunction

" augroup BWCCreateDir
"   autocmd!
"   autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
" augroup END

" " === Set local cursor line ===
" " augroup CursorLine
" "   au!
" "   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
" "   au WinLeave * setlocal nocursorline
" " augroup END

" " Search and replace
" function! s:ag_to_qf(line)
"   let parts = split(a:line, ':')
"   echo parts
"   return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
"         \ 'text': join(parts[3:], ':')}
" endfunction

" function! AgToQF(query)
"   call setqflist(map(systemlist('ag --column '.a:query), 's:ag_to_qf(v:val)'))
" endfunction

" function! CWDSearchAndReplace(word)
"     let replacement = input("Replace \"" . a:word . "\" with: ")
"     call inputrestore()
"     call AgToQF(a:word)
"     execute "cdo %s/" . a:word . "/" . replacement ."/gc"
" endfunction

" VIMRC
execute pathogen#infect()
set nocompatible               " be iMproved, required
set more
set ttyfast
set lazyredraw

" === Leader ==================================================
let mapleader = " "

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

set autowrite                  " Enable automatically :write before running commands
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

set timeoutlen=1000 ttimeoutlen=0

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


" === Commands ================================================

autocmd! User GoyoEnter Limelight   " On Goyo enter enable limelight
autocmd! User GoyoLeave Limelight!  " On Goyo leave disable limelight
autocmd! BufWritePre * :%s/\s\+$//e " When alter buffs trim white space
command! UnMinify call UnMinify()   " Simple re-format for minified Javascript

" === Plugins configurations ==================================

let g:used_javascript_libs = 'jquery,underscore,angularjs,react'

" === Buffergator =============================================

let g:buffergator_suppress_keymaps = 1 " I want my own keymappings...

" === Airline =================================================

let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" === PeekABoo ===============================================
"
let g:peekaboo_window = 'vertical botright 130new' " Default peekaboo window
let g:peekaboo_compact = 1 " Compact display; do not display the names of the register groups
let g:peekaboo_prefix = '<leader>' " Prefix for the peekaboo key mapping (default: '')

" Nvim scrapes
" Old, to remove
" Buffers
" Plug 'jeetsukumaran/vim-buffergator'
" Plug 'szw/vim-maximizer'

" Color manipulation
" Plug 'xolox/vim-colorscheme-switcher'
" Plug 'altercation/vim-colors-solarized'

" Miscellaneous
" Plug 'xolox/vim-misc'

" To avaliate
" Plug 'hkupty/zen.nvim'
" Plug 'tpope/vim-speeddating'
" Plug 'majutsushi/tagbar'
" Plug 'xolox/vim-easytags'
" Plug 'Shougo/neocomplete.vim'
" Plug 'tpope/vim-sensible'
" Plug 'wincent/command-t'
" Plug 'elzr/vim-json'
" Plug 'kchmck/vim-coffee-script'
" Plug 'gregsexton/MatchTag'
" Plug 'janko-m/vim-test'
" Plug 'TaskList.vim'
" Plug 'ervandew/supertab'
" Plug 'tpope/vim-abolish'

" Color themes
" Plug 'nanotech/jellybeans.vim'
" Plug 'mkarmona/colorsbox'
" Plug 'junegunn/seoul256.vim'
" Plug 'crusoexia/vim-monokai'

" Old persisted
" set list listchars=tab:\ \ ,trail:·
" set lazyredraw
" set updatetime=250             " Change update time of files to 250ms
" set relativenumber             " Show relative line number / speed issues
" set nowrap                     " Don't wrap lines
" set linebreak                  " Wrap lines at convenient points

" " === Folds ===================================================

" set foldmethod=indent          " fold based on indent
" set foldnestmax=3              " deepest fold is 3 levels
" set nofoldenable               " dont fold by default

" " === Treat <li> and <p> tags like the block tags they are ====
" let g:html_indent_tags = 'li\|p'


" Missing validation


