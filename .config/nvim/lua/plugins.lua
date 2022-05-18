local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Commands
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish' -- Search and replace subvert pattern
  use 'alvan/vim-closetag'

  -- Search
  use 'markonm/traces.vim'
  use 'kevinhwang91/nvim-hlslens'
  -- use 'haya14busa/is.vim' -- Missing review

  -- Sessions
  use {
    'rmagatti/auto-session',
    config = function ()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppression_dirs = {'~/Projects'}
      }
    end
  }

  -- Manipulate files
  use 'tpope/vim-eunuch' -- UNIX commands
  use {
    'scrooloose/nerdtree',
    opt = true,
    cmd = { 'NERDTreeFind', 'NERDTreeToggle' },
    requires = { { 'Xuyuanp/nerdtree-git-plugin', opt = true } }
  }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- FZF
  use { 'junegunn/fzf', run = 'cd $XDG_DATA_HOME/fzf && ./install --xdg --no-update-rc' }
  use 'junegunn/fzf.vim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' }
    }
  }

  -- Motion
  use 'phaazon/hop.nvim'
  use 'wellle/targets.vim'
  use 'justinmk/vim-sneak'
  -- use {'pechorin/any-jump.vim'}

  -- CoC
  -- use {'neoclide/coc.nvim', branch = 'release'}
  -- use {'tpope/vim-endwise'}

  -- Coq
  -- use {'ms-jpq/coq_nvim', branch = 'coq'}
  -- use {'ms-jpq/coq.artifacts', branch = 'artifacts'} -- 9000+ Snippets
  -- use {'ms-jpq/coq.thirdparty', branch = '3p'} -- lua & third party sources

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'folke/lsp-colors.nvim'

  -- Comp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  -- Snippets
  -- use {'SirVer/ultisnips'}
  use 'honza/vim-snippets'
  use { 'saadparwaiz1/cmp_luasnip', requires = { { 'L3MON4D3/LuaSnip' } } }


  -- Layout && Status
  use { 'mhinz/vim-startify', opt = true, cmd = { 'SSave', 'SLoad', 'Startify' } }
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Syntax
  -- use 'tomtom/tcomment_vim'
  -- use 'dense-analysis/ale'
  use 'editorconfig/editorconfig-vim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup { ignore = '^$' }
    end
  }

  -- Highlighting
  use 'pangloss/vim-javascript'
  use 'othree/javascript-libraries-syntax.vim'
  -- use 'vim-ruby/vim-ruby'
  use 'slim-template/vim-slim'
  use 'mxw/vim-jsx'
  use 'martinda/Jenkinsfile-vim-syntax'

  -- Color
  use 'joshdick/onedark.vim'
  use 'rktjmp/lush.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'sheerun/vim-polyglot'

  -- Git
  -- use 'mhinz/vim-signify'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tommcdo/vim-fubitive'
  use 'sodapopcan/vim-twiggy'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Html
  use 'mattn/emmet-vim'
  use 'tmhedberg/matchit'
  use 'jiangmiao/auto-pairs'
  -- use {'Valloric/MatchTagAlways'}

  -- Ruby & Rails
  use 'janko-m/vim-test'
  -- use 'tpope/vim-rails'
  use { 'tpope/vim-dispatch', opt = true, cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
  use 'benmills/vimux'

  -- Debugging
  use 'szw/vim-maximizer'

  -- Lua
  use 'nanotee/luv-vimdocs'
  use 'milisims/nvim-luaref'

  if PackerBootstrap then
    require('packer').sync()
  end
end)
