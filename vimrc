execute pathogen#infect()
set nocompatible
filetype plugin indent on
set t_Co=256
set number
set expandtab
set shiftwidth=2
set tabstop=2
set enc=utf-8
set showcmd

set cc=120
highlight ColorColumn ctermbg=0 guibg=lightgrey

" let g:solarized_termcolors=256
syntax on
syntax enable
set background=dark
colorscheme gruvbox
" colorscheme solarized
set laststatus=2
let g:netrw_liststyle=3

set nocompatible              " be iMproved, required
set mouse=a
filetype off                  " required
let g:indentLine_color_term = 239

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-rails'

Plugin 'slim-template/vim-slim'

Plugin 'kien/ctrlp.vim'

Plugin 'tpope/vim-endwise'

Plugin 'tpope/vim-fugitive'

Plugin 'bling/vim-airline'

Plugin 'altercation/vim-colors-solarized'

Plugin 'ap/vim-css-color'

Plugin 'gregsexton/MatchTag'

Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-surround'

Plugin 'scrooloose/syntastic'

Plugin 'elzr/vim-json'

Plugin 'tpope/vim-sensible'

Plugin 'hail2u/vim-css3-syntax'

Plugin 'tpope/vim-haml'

Plugin 'Raimondi/delimitMate'

Plugin 'Shougo/neocomplete.vim'

Plugin 'tpope/vim-bundler'

Plugin 'morhetz/gruvbox'

Plugin 'tpope/vim-eunuch'

Plugin 'tpope/vim-abolish'

Plugin 'tpope/vim-commentary'

Plugin 'flazz/vim-colorschemes'

Plugin 'janko-m/vim-test'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-colorscheme-switcher'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
filetype indent on
let g:indent_guides_auto_colors=0
hi IndentGuidesEven ctermbg=238
hi IndentGuidesOdd ctermbg=236
"set listchars=tab:\|\
"set list
set nohlsearch
set incsearch
set autoindent
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>

" Removes trailing spaces
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

" Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
    %s/{\ze[^\r\n]/{\r/g
    %s/){/) {/g
    %s/};\?\ze[^\r\n]/\0\r/g
    %s/;\ze[^\r\n]/;\r/g
    %s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
    normal ggVG=
endfunction

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

" Move lines using Ctrl+j and Ctrl+k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
