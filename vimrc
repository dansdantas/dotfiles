execute pathogen#infect()
set nocompatible               " be iMproved, required

set nobackup
set nowritebackup
set history=50
set ruler
set showcmd
set incsearch                  "Do incremental search
set laststatus=2               "Aways display status line
set updatetime=250             "Change update time of files to 250ms
set number                     "Show line number

set expandtab                  "Convert tabs to spaces
set tabstop=2                  "Default tab space to 2
set backspace=2                "Delete 2 spaces
set shiftwidth=2               "Column space on identation << or >>
set autoindent                 "Enable automatic indentation"

set cursorcolumn               "Show column cursor mark
set cursorline                 "Show line cursor mark
set cc=120                     "Add delimitation line on 120 character

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%121v.\+/

syntax on                      "Add syntax highlight

set background=dark            "Set default backgroud to dark
set t_Co=256                   "Use on vim 256 colors
let g:solarized_termcolors=256 "Set 256 solarized colors
colorscheme Tomorrow-Night

set enc=utf-8                  "Set default encode

filetype plugin indent on

let g:netrw_liststyle=3        "Use tree style for netrw
set mouse=a                    "Enable select with mouse on supported modes

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

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
