vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- -- Simple plugins can be specified as strings
  -- use '9mm/vim-closer'

  -- -- Lazy loading:
  -- -- Load on specific commands
  -- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}

  -- -- Load on an autocommand event
  -- use {'andymass/vim-matchup', event = 'VimEnter'}

  -- -- Load on a combination of conditions: specific filetypes or commands
  -- -- Also run code after load (see the "config" key)
  -- use {
  --   'w0rp/ale',
  --   ft = {'sh', 'zsh', 'bash', 'c', 'cpp', 'cmake', 'html', 'markdown', 'racket', 'vim', 'tex'},
  --   cmd = 'ALEEnable',
  --   config = 'vim.cmd[[ALEEnable]]'
  -- }

  -- -- useins can have dependencies on other plugins
  -- use {
  --   'haorenW1025/completion-nvim',
  --   opt = true,
  --   requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
  -- }

  -- -- useins can also depend on rocks from luarocks.org:
  -- use {
  --   'my/supercoolplugin',
  --   rocks = {'lpeg', {'lua-cjson', version = '2.1.0'}}
  -- }

  -- -- You can specify rocks in isolation
  -- use_rocks 'penlight'
  -- use_rocks {'lua-resty-http', 'lpeg'}

  -- -- Local plugins can be included
  -- use '~/projects/personal/hover.nvim'

  -- -- useins can have post-install/update hooks
  -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- -- Post-install/update hook with neovim command
  -- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- -- Post-install/update hook with call of vimscript function with argument
  -- use { 'glacambre/firenvim', run = function() vim.fn['firenvim#install'](0) end }

  -- -- Use specific branch, dependency and run lua file after load
  -- use {
  --   'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  -- -- Use dependency and run lua function after load
  -- use {
  --   'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  --   config = function() require('gitsigns').setup() end
  -- }

  -- -- You can specify multiple plugins in a single call
  -- use {'tjdevries/colorbuddy.vim', {'nvim-treesitter/nvim-treesitter', opt = true}}

  -- -- You can alias plugin names
  -- use {'dracula/vim', as = 'dracula'}

  -- MINE
  -- Manipulate files and buffers
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-eunuch' -- UNIX commands
  use 'markonm/traces.vim' -- Preview pattern and replacement in :s
  use 'vim-scripts/restore_view.vim'
  use 'rmagatti/auto-session'

  -- Search files
  use {
    'scrooloose/nerdtree',
    opt = true,
    cmd = {'NERDTreeFind', 'NERDTreeToggle'},
    requires = {{'Xuyuanp/nerdtree-git-plugin', opt = true}}
  }

  use {'junegunn/fzf', run = 'cd $XDG_DATA_HOME/fzf && ./install --xdg --no-update-rc'}
  use 'junegunn/fzf.vim'
  use 'tpope/vim-abolish' -- Search and replace subvert pattern

  -- Tree shitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'

  -- telescope requirements...
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Motion
  use 'phaazon/hop.nvim'
  use 'wellle/targets.vim'
  use 'justinmk/vim-sneak'

  -- CoC
  -- use {'neoclide/coc.nvim', branch = 'release'}
  -- use 'tpope/vim-endwise'

  -- Coq
  use {'ms-jpq/coq_nvim', branch = 'coq'}

  -- 9000+ Snippets
  use {'ms-jpq/coq.artifacts', branch = 'artifacts'}

  -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
  -- Need to **configure separately**
  use {'ms-jpq/coq.thirdparty', branch = '3p'}
  -- - shell repl
  -- - nvim lua api
  -- - scientific calculator
  -- - comment banner
  -- - etc

  -- LSP
  -- use 'neovim/nvim-lspconfig'
  -- use 'nvim-lua/completion-nvim'
  -- use 'folke/lsp-colors.nvim'

  -- Completion
  -- use 'Valloric/MatchTagAlways'
  -- use 'pechorin/any-jump.vim'
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'

  -- Snippets
  --use 'SirVer/ultisnips'
  --use 'honza/vim-snippets'

  -- Layout && Status
  use {'mhinz/vim-startify', opt = true, cmd = {'SSave', 'SLoad', 'Startify'}}
  use 'itchyny/lightline.vim'
  use 'maximbaz/lightline-ale'

  -- Syntax
  use 'editorconfig/editorconfig-vim'
  use 'tomtom/tcomment_vim'
  use 'dense-analysis/ale'

  -- Highlighting
  use 'pangloss/vim-javascript'
  use 'othree/javascript-libraries-syntax.vim'
  use 'vim-ruby/vim-ruby'
  use 'slim-template/vim-slim'
  use 'mxw/vim-jsx'
  use 'martinda/Jenkinsfile-vim-syntax'

  -- Color
  use 'joshdick/onedark.vim'
  use 'rktjmp/lush.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'sheerun/vim-polyglot'

  -- Git
  use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tommcdo/vim-fubitive'
  use 'sodapopcan/vim-twiggy'

  -- Html
  use 'mattn/emmet-vim'
  use 'tmhedberg/matchit'

  -- Ruby & Rails
  use 'janko-m/vim-test'
  use 'tpope/vim-rails'
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use 'benmills/vimux'

  -- Debugging
  use 'szw/vim-maximizer'
end)
