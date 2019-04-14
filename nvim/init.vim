" -------------------------------------------------------------------
" Plugins handler
" -------------------------------------------------------------------

call plug#begin('~/.config/nvim/plugged')

" Manipulate files and buffers
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Search files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
Plug 'Xuyuanp/nerdtree-git-plugin'

" Motion
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'justinmk/vim-sneak'

" Completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Valloric/MatchTagAlways'
Plug 'tpope/vim-endwise'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

" Layout && Status
Plug 'mhinz/vim-startify', { 'on': ['SSave', 'SLoad', 'Startitfy'] }
Plug 'itchyny/lightline.vim'

" Syntax
Plug 'tomtom/tcomment_vim'
Plug 'w0rp/ale'

" Highlighting
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'digitaltoad/vim-pug'
Plug 'slim-template/vim-slim'
Plug 'iloginow/vim-stylus'
Plug 'mxw/vim-jsx'

" Color & Themes
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tommcdo/vim-fubitive'
Plug 'sodapopcan/vim-twiggy'

" Html
Plug 'mattn/emmet-vim'
Plug 'tmhedberg/matchit'

" Ruby & Rails
Plug 'janko-m/vim-test'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-dispatch'

call plug#end()

" -------------------------------------------------------------------
" General
" -------------------------------------------------------------------

" === Leader ===
let g:mapleader = "\<Space>"

" === Config ===
set encoding=utf-8  " Set encoding
set noshowmode      " Disable warning if changes modes on status line
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
abbr todo: <esc>:call AddToDo()<cr>

" === Keep undo history across sessions, by storing in file ===
call system('mkdir -p ~/.config/nvim/undo')
set undofile
set undodir=~/.config/nvim/undo

" === Folding ===
set foldmethod=manual
set foldlevel=9999

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

" === Disable visual mode
map Q <nop>

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Quickfix
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>r :cprevious<CR>

" Copy current file path to clipboard
nmap ,cs :let @+=expand("%")<CR>
nmap ,cl :let @+=expand("%:p")<CR>

" Search current word on help
nmap ,he "zyiw:exe "h ".@z.""<CR>

" Search for word under cursor using Ag
nmap <Leader>ag "zyiw:exe "Ag ".@z.""<CR>

" Global folding
nnoremap <Leader>z :call FoldingToggleFold()<cr>

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
let $FZF_DEFAULT_COMMAND = 'ag --vimgrep --hidden --ignore .git -l -g ""'
nnoremap <leader>o :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>ag :Ag<Space>
nnoremap <leader>e :BLines<CR>
nnoremap <leader>i :Commands<CR>

" === Deoplete ===
let g:deoplete#enable_at_startup = 1
let g:deoplete#tag#cache_limit_size = 5000000
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" === StatusLine ===
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'inactive': {
  \   'left': [ [ 'relativepath', 'modified' ] ]
  \ },
\ }

" === Signify ===
let g:signify_vcs_list = ['git']
let g:signify_realtime = 1

" === Python ===
let g:python_host_prog = $PYENV_ROOT.'/versions/2.7.14/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/3.6.3/bin/python'
let g:ycm_server_python_interpreter = $PYENV_ROOT.'/versions/3.6.3/bin/python'

" === ALE ===
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_linters = {
\   'javascript': ['jshint', 'eslint'],
\   'ruby': ['reek', 'rubocop', 'ruby', 'rails_best_practices']
\}
nnoremap <leader>k :ALEPrevious<CR>
nnoremap <leader>K :ALEPreviousWrap<CR>
nnoremap <leader>j :ALENext<CR>
nnoremap <leader>J :ALENextWrap<CR>
nnoremap <leader>m :ALELint<CR>

" === File manager ===
nnoremap <leader>F :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

" === Vue ===
autocmd FileType vue syntax sync fromstart
let g:used_javascript_libs = 'underscore,vue,jquery'

" === Test ===
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tg :TestVisit<CR>

" === Motion ===
let g:sneak#s_next = 1
let g:sneak#label = 1

" -------------------------------------------------------------------
" Functions
" -------------------------------------------------------------------

function! AddToDo()
    let branch_name = system('printf $(git rev-parse --abbrev-ref HEAD)')
    execute 'normal! i @todo '.branch_name.' -'
    startinsert!
endfunction

""" folding
function! FoldingToggleFold()
   if foldlevel('.') == 0
      " No fold exists at the current line,
      " so create a fold based on indentation

      let l_min = line('.')   " the current line number
      let l_max = line('$')   " the last line number
      let i_min = indent('.') " the indentation of the current line
      let l = l_min + 1

      " Search downward for the last line whose indentation > i_min
      while l <= l_max
         " if this line is not blank ...
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            if indent(l) <= i_min

               " we've gone too far
               let l = l - 1    " backtrack one line
               break
            endif
         endif
         let l = l + 1
      endwhile

      " Clamp l to the last line
      if l > l_max
         let l = l_max
      endif

      " Backtrack to the last non-blank line
      while l > l_min
         if strlen(getline(l)) > 0 && getline(l) !~ '^\s*$'
            break
         endif
         let l = l - 1
      endwhile

      "execute "normal i" . l_min . "," . l . " fold"   " print debug info

      if l > l_min
         " Create the fold from l_min to l
         execute l_min . "," . l . " fold"
      endif
   else
      " Delete the fold on the current line
      normal zd
   endif
endfunction
