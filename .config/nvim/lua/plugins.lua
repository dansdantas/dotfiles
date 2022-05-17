local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

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
  use 'kevinhwang91/nvim-hlslens'

  -- Tree shitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'

  -- telescope requirements...
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-telescope/telescope-fzy-native.nvim'

  -- Motion
  use 'phaazon/hop.nvim'
  use 'wellle/targets.vim'
  use 'justinmk/vim-sneak'

  -- CoC
  use {'neoclide/coc.nvim', branch = 'release', disable = true}
  use {'tpope/vim-endwise', disable = true}

  -- Coq
  use {'ms-jpq/coq_nvim', branch = 'coq'}
  use {'ms-jpq/coq.artifacts', branch = 'artifacts'} -- 9000+ Snippets
  use {'ms-jpq/coq.thirdparty', branch = '3p'} -- lua & third party sources

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'folke/lsp-colors.nvim'

  -- Completion
  use {'Valloric/MatchTagAlways', disable = true}
  use {'pechorin/any-jump.vim', disable = true}
  use 'jiangmiao/auto-pairs'
  use 'alvan/vim-closetag'

  -- Snippets
  use {'SirVer/ultisnips', disable = true}
  use {'honza/vim-snippets', disable = true}

  -- Layout && Status
  use {'mhinz/vim-startify', opt = true, cmd = {'SSave', 'SLoad', 'Startify'}}
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Syntax
  use 'editorconfig/editorconfig-vim'
  use 'tomtom/tcomment_vim'
  use 'dense-analysis/ale'

  -- Highlighting
  use 'pangloss/vim-javascript'
  use 'othree/javascript-libraries-syntax.vim'
  use {'vim-ruby/vim-ruby', disable = true}
  use 'slim-template/vim-slim'
  use 'mxw/vim-jsx'
  use 'martinda/Jenkinsfile-vim-syntax'

  -- Color
  use 'joshdick/onedark.vim'
  use 'rktjmp/lush.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'sheerun/vim-polyglot'

  -- Git
  use {'mhinz/vim-signify', disable = true }
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

  -- Ruby & Rails
  use 'janko-m/vim-test'
  use {'tpope/vim-rails', disable = true}
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
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
