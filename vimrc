" execute pathogen#infect()
" set nocompatible               " be iMproved, required
" set more
" set ttyfast
" set lazyredraw

" " === Leader ==================================================
" let mapleader = " "

" " === General Config ==========================================

" syntax on                      " Add syntax highlight
" filetype plugin indent on      " Enable plugin to filetype of file

" set history=50
" set enc=utf-8                  " Set default encode
" set mouse=a                    " Enable select with mouse on supported modes
" set showcmd                    " Show incomplete commands
" set laststatus=2               " Aways display status line
" set updatetime=250             " Change update time of files to 250ms
" set showmatch                  " Show matcher when above cursor

" " set relativenumber             " Show relative line number / speed issues
" set number                     " Show line number
" set numberwidth=4              " Define width to number spaces

" " set cursorline                 " Show line cursor mark / speed issues
" set ruler                      " Show ruler
" set cc=120                     " Add delimitation line on 120 character
" set nowrap                     " Don't wrap lines
" set linebreak                  " Wrap lines at convenient points

" " === Indentation =============================================

" set ai                         " Enable automatic indentation"
" set backspace=2                " Delete 2 spaces
" set shiftwidth=2               " Column space on identation << or >>
" set tabstop=2                  " Default tab space to 2 on tabs
" set softtabstop=2              " Default tab space to 2 on spaces
" set expandtab                  " Convert tabs to spaces
" set smartindent                " Automatically inserts one extra level of indentation
" set smarttab                   " Insert indentation according to shiftwidth
" set shiftround                 " Calculate shiftwidth based on line start

" " === Colos configuration =====================================

" let g:solarized_termcolors=256 " Set 256 solarized colors
" set termguicolors              " Use true color on vim
" set background=dark            " Set default backgroud to dark
" colorscheme onedark

" " === Turn off swap files =====================================

" set noswapfile                 " Disable create of swap file
" set nobackup
" set nowritebackup

" " === Keep undo history across sessions, by storing in file ===

" call system('mkdir -p ~/.vim/undo')
" set undofile
" set undodir=~/.vim/undo

" " === Display tabs and trailing spaces visually ===============

" set list listchars=tab:\ \ ,trail:·

" " === Folds ===================================================

" set foldmethod=indent          " fold based on indent
" set foldnestmax=3              " deepest fold is 3 levels
" set nofoldenable               " dont fold by default

" " === Scrolling ===============================================

" set scrolloff=15               " Start scrolling when we're 8 lines away from margins
" set sidescrolloff=15
" set sidescroll=1

" " === Automatic change on files ===============================

" set autowrite                  " Enable automatically :write before running commands
" set autoread                   " Reload files changed outside vim

" " === Search ==================================================

" set incsearch                  " Find the next match as we type the search
" set nohlsearch                 " Do not highlight searches by default
" set ignorecase                 " Ignore case when searching...
" set smartcase                  " ...unless we type a capital

" " === Treat <li> and <p> tags like the block tags they are ====
" let g:html_indent_tags = 'li\|p'

" " === Abbreviations ===========================================

" iabbr pry binding.pry
" iabbr dbg debugger
" iabbr log console.log

" " === Open new split panes to right and bottom ================

" set splitbelow
" set splitright

" " === Better handle timeout(need more work) ===================

" set timeoutlen=1000 ttimeoutlen=0

" " === Expand extra files ======================================

" if filereadable(expand("~/.vimrc.bundles"))
"   source ~/.vimrc.bundles
" endif

" if filereadable(expand("~/.vimrc.functions"))
"   source ~/.vimrc.functions
" endif

" if filereadable(expand("~/.vimrc.keymaps"))
"   source ~/.vimrc.keymaps
" endif


" " === Commands ================================================

" autocmd! User GoyoEnter Limelight   " On Goyo enter enable limelight
" autocmd! User GoyoLeave Limelight!  " On Goyo leave disable limelight
" autocmd! BufWritePre * :%s/\s\+$//e " When alter buffs trim white space
" command! UnMinify call UnMinify()   " Simple re-format for minified Javascript

" " === Plugins configurations ==================================

" let g:used_javascript_libs = 'jquery,underscore,angularjs,react'

" " === Buffergator =============================================

" let g:buffergator_suppress_keymaps = 1 " I want my own keymappings...

" " === Airline =================================================

" let g:airline#extensions#tabline#enabled = 1     " Enable the list of buffers
" let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" " === PeekABoo ===============================================
" "
" let g:peekaboo_window = 'vertical botright 130new' " Default peekaboo window
" let g:peekaboo_compact = 1 " Compact display; do not display the names of the register groups
" let g:peekaboo_prefix = '<leader>' " Prefix for the peekaboo key mapping (default: '')

" " Nvim scrapes
" " Old, to remove
" " Buffers
" " Plug 'jeetsukumaran/vim-buffergator'
" " Plug 'szw/vim-maximizer'

" " Color manipulation
" " Plug 'xolox/vim-colorscheme-switcher'
" " Plug 'altercation/vim-colors-solarized'

" " Miscellaneous
" " Plug 'xolox/vim-misc'

" " To avaliate
" " Plug 'hkupty/zen.nvim'
" " Plug 'tpope/vim-speeddating'
" " Plug 'majutsushi/tagbar'
" " Plug 'xolox/vim-easytags'
" " Plug 'Shougo/neocomplete.vim'
" " Plug 'tpope/vim-sensible'
" " Plug 'wincent/command-t'
" " Plug 'elzr/vim-json'
" " Plug 'kchmck/vim-coffee-script'
" " Plug 'gregsexton/MatchTag'
" " Plug 'janko-m/vim-test'
" " Plug 'TaskList.vim'
" " Plug 'ervandew/supertab'
" " Plug 'tpope/vim-abolish'

" " Color themes
" " Plug 'nanotech/jellybeans.vim'
" " Plug 'mkarmona/colorsbox'
" " Plug 'junegunn/seoul256.vim'
" " Plug 'crusoexia/vim-monokai'

" " Old persisted
" " set list listchars=tab:\ \ ,trail:·
" " set lazyredraw
" " set updatetime=250             " Change update time of files to 250ms
" " set relativenumber             " Show relative line number / speed issues
" " set nowrap                     " Don't wrap lines
" " set linebreak                  " Wrap lines at convenient points

" " " === Folds ===================================================

" " set foldmethod=indent          " fold based on indent
" " set foldnestmax=3              " deepest fold is 3 levels
" " set nofoldenable               " dont fold by default

" " " === Treat <li> and <p> tags like the block tags they are ====
" " let g:html_indent_tags = 'li\|p'


" " Missing validation

" vimrc.bundle "
"
" if &compatible
"   set nocompatible
" end

" " Shim command and function to allow migration from Vundle to vim-plug.
" function! VundleToPlug(vundle_command, arg, ...)
"   echom "You are using Vundle's `".a:vundle_command."` command to declare plugins. Dotfiles now uses vim-plug for plugin management. Please rename uses of `".a:vundle_command."` to `Plug`. Plugin was '".a:arg."'."
"   let vim_plug_options = {}

"   if a:0 > 0
"     if has_key(a:1, 'name')
"       let name = a:1.name
"       let vim_plug_options.dir = "$HOME/.vim/bundle/".a:1.name
"     endif

"     if has_key(a:1, 'rtp')
"       let vim_plug_options.rtp = a:1.rtp
"     endif
"   endif

"   Plug a:arg, vim_plug_options
" endfunction

" com! -nargs=+  -bar Plugin call VundleToPlug("Plugin", <args>)
" com! -nargs=+  -bar Bundle call VundleToPlug("Bundle", <args>)

" call plug#begin('~/.vim/bundle')

" " Manipulate files
" Plug 'mbbill/undotree', { 'on': 'UndotreeToggle'   }
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-eunuch'

" " Search files
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'

" " Search file content
" Plug 'henrik/vim-indexed-search'

" " Productivity
" Plug 'wakatime/vim-wakatime'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'

" " Buffer and window manipulations
" Plug 'schickling/vim-bufonly'
" Plug 'jeetsukumaran/vim-buffergator'
" Plug 'szw/vim-maximizer'

" " Motion
" Plug 'easymotion/vim-easymotion', { 'on': '<plug>(easymotion-s2)' }
" Plug 'junegunn/vim-peekaboo'

" " Completion
" Plug 'Valloric/YouCompleteMe'
" Plug 'Valloric/MatchTagAlways'
" Plug 'Raimondi/delimitMate'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-speeddating'

" " Tree
" Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Plug 'Xuyuanp/nerdtree-git-plugin'

" " Layout
" Plug 'junegunn/vim-easy-align', { 'on': ['<Plug>(EasyAlign)', 'EasyAlign'] }
" Plug 'mhinz/vim-startify'

" " Status
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" " Syntax
" Plug 'scrooloose/syntastic'
" Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }

" " Syntax color
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'slim-template/vim-slim'
" Plug 'ap/vim-css-color'
" Plug 'hail2u/vim-css3-syntax'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'vim-ruby/vim-ruby'
" Plug 'othree/javascript-libraries-syntax.vim'

" " Color manipulation
" Plug 'xolox/vim-colorscheme-switcher'
" Plug 'altercation/vim-colors-solarized'

" " Color themes
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'morhetz/gruvbox'
" Plug 'tomasr/molokai'
" Plug 'sickill/vim-monokai'
" Plug 'joshdick/onedark.vim'
" Plug 'junegunn/seoul256.vim'

" " Rails section
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rails'

" " Git
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'

" " Miscellaneous
" Plug 'xolox/vim-misc'

" " To avaliate
" " Plug 'majutsushi/tagbar'
" " Plug 'xolox/vim-easytags'
" " Plug 'Shougo/neocomplete.vim'
" " Plug 'tpope/vim-sensible'
" " Plug 'wincent/command-t'
" " Plug 'elzr/vim-json'
" " Plug 'kchmck/vim-coffee-script'
" " Plug 'gregsexton/MatchTag'
" " Plug 'janko-m/vim-test'
" " Plug 'TaskList.vim'
" " Plug 'ervandew/supertab'
" " Plug 'tpope/vim-abolish'

" call plug#end()
" filetype plugin indent on

" vimrc.functions "
"
" " =========== Automatic enter on paste mode on paste ===============

" function! XTermPasteBegin()
"   set pastetoggle=<Esc>[201~
"   set paste
"   return ""
" endfunction

" " ===========  Removes trailing spaces =============================

" function! TrimWhiteSpace()
"     %s/\s\+$//e
" endfunction

" " ===========  Simple re-format for minified Javascript ============

" function! UnMinify()
"     %s/{\ze[^\r\n]/{\r/g
"     %s/){/) {/g
"     %s/};\?\ze[^\r\n]/\0\r/g
"     %s/;\ze[^\r\n]/;\r/g
"     %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
"     normal ggVG=
" endfunction

" " =========== Create directory to no directory =====================

" function s:MkNonExDir(file, buf)
"     if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
"         let dir=fnamemodify(a:file, ':h')
"         if !isdirectory(dir)
"             call mkdir(dir, 'p')
"         endif
"     endif
" endfunction

" augroup BWCCreateDir
"   autocmd!
"   autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
" augroup END


" " =========== Use command line =====================================

" function! CmdLine(str)
"     exe "menu Foo.Bar :" . a:str
"     emenu Foo.Bar
"     unmenu Foo
" endfunction

" " =========== Search based on selection ============================

" function! VisualSelection(direction, extra_filter) range
"     let l:saved_reg = @"
"     execute "normal! vgvy"

"     let l:pattern = escape(@", '\\/.*$^~[]')
"     let l:pattern = substitute(l:pattern, "\n$", "", "")

"     if a:direction == 'b'
"         execute "normal ?" . l:pattern . "^M"
"     elseif a:direction == 'gv'
"         call CmdLine("Ag \"" . l:pattern . "\" " )
"     elseif a:direction == 'replace'
"         call CmdLine("%s" . '/'. l:pattern . '/')
"     elseif a:direction == 'f'
"         execute "normal /" . l:pattern . "^M"
"     endif

"     let @/ = l:pattern
"     let @" = l:saved_reg
" endfunction

" " ========== FZF ===================================================

" function! s:find_root()
"   for vcs in ['.git', '.svn', '.hg']
"     let dir = finddir(vcs.'/..', ';')
"     if !empty(dir)
"       execute 'FZF' dir
"       return
"     endif
"   endfor
"   FZF
" endfunction

" command! FZFR call s:find_root()
"
" vimrc.keymaps "
" " ===============  Map save file to leader ==============================
" nnoremap <leader>w :w!<cr>
" nnoremap <leader>x :x!<cr>
" nnoremap <leader>q :q<cr>
" nnoremap <leader>z :qa<cr>

" " ===============  Edit files ===========================================
" noremap Y y$

" "================  Move lines using Ctrl+j and Ctrl+k ===================
" " nnoremap <C-j> :m .+1<CR>==
" " nnoremap <C-k> :m .-2<CR>==
" " inoremap <C-j> <Esc>:m .+1<CR>==gi
" " inoremap <C-k> <Esc>:m .-2<CR>==gi
" " vnoremap <C-j> :m '>+1<CR>gv=gv
" " vnoremap <C-k> :m '<-2<CR>gv=gv

" " =============== Auto indent pasted text ===============================
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

" " =============== Remove white spaces ===================================
" nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" " =============== TrimWhiteSpace ========================================
" nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

" " =============== Search on visual selection ============================
" vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" " =============== Move to split ========== ==============================
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>

" " ================ Movements ============================================

" " Move vertically by visual line
" nnoremap j gj
" nnoremap k gk

" " Move to beginning/end of line
" nnoremap B ^
" nnoremap E $

" " Highlight last inserted text
" nnoremap gV `[v`]

" " Toggle gundo
" nnoremap <leader>u :UndotreeToggle<CR>

" " Save session
" nnoremap <leader>s :SSave<CR>

" " Toggle NERDTree
" noremap <leader>t :NERDTreeToggle<CR>

" " ================ BufferGator ==========================================
" " Looper buffers
" "let g:buffergator_mru_cycle_loop = 1

" " Go to the previous buffer open
" nnoremap <leader>jj :BuffergatorMruCyclePrev<cr>

" " Go to the next buffer open
" nnoremap <leader>kk :BuffergatorMruCycleNext<cr>

" " View the entire list of buffers open
" nnoremap <leader>bl :BuffergatorOpen<cr>

" " Shared bindings from Solution #1 from earlier
" nnoremap <leader>T :enew<cr>
" nnoremap <leader>bq :bp <BAR> bd #<cr>
" " This allows buffers to be hidden if you've modified a buffer.
" " This is almost a must if you wish to use buffers in this way.
" " set hidden

" " To open a new empty buffer
" " This replaces :tabnew which I used to bind to this mapping
" " nnoremap <leader>T :enew<cr>

" " Move to the next buffer
" " nnoremap <leader>l :bnext<CR>

" " Move to the previous buffer
" " nnoremap <leader>h :bprevious<CR>

" " Close the current buffer and move to the previous one
" " This replicates the idea of closing a tab
" " nnoremap <leader>bq :bp <BAR> bd #<CR>

" " Show all open buffers and their status
" " nnoremap <leader>bl :ls<CR>

" " Easy bindings for its various modes
" " nnoremap <leader>bb :CtrlPBuffer<cr>
" " nnoremap <leader>bm :CtrlPMixed<cr>
" " nnoremap <leader>bs :CtrlPMRU<cr>
" "
" " ================= Show current highlight ==============================

" nnoremap <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
" \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
" \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" " ================= Preview ctags definition ============================

" nnoremap <C-]> <Esc>:exe "ptjump " . expand("<cword>")<Esc>

" " ================= Vim easy align ======================================

" " Start interactive EasyAlign in visual mode (e.g. vipga)
" xmap ga <Plug>(EasyAlign)

" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
" nmap ga <Plug>(EasyAlign)

" " ================= Bufonly =============================================

" nnoremap <C-B> <Esc>:Bufonly<Esc>

" " ================= FZF =================================================

" noremap <C-P> :FZF<CR>
" nnoremap <leader>a :Ag
" nnoremap <leader>c :Colors<cr>
