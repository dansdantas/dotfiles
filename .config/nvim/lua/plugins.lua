local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local PackerBootstrap

if fn.empty(fn.glob(install_path)) > 0 then
  PackerBootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Commands
  use {
    "kylechui/nvim-surround",
    config = function() require("nvim-surround").setup {} end
   }
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish' -- Search and replace subvert pattern
  use 'alvan/vim-closetag'
  use 'karb94/neoscroll.nvim'

  -- Search
  use 'markonm/traces.vim'
  use {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup({
        calm_down = true,
      })
    end
  }

  -- Sessions
  use {
    'rmagatti/session-lens',
    after = 'telescope.nvim',
    requires = { 'rmagatti/auto-session', 'nvim-telescope/telescope.nvim' },
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppression_dirs = { '~/Projects' }
      }
      require('session-lens').setup {
        path_display = { 'shorten' },
        theme_conf = { border = false },
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
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function ()
      pcall(require("nvim-treesitter.install").update { with_sync = true })
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    after = "nvim-treesitter",
  }

  use "RRethy/nvim-treesitter-endwise"
  use 'nvim-treesitter/playground'

  use { "aarondiel/spread.nvim" }

  -- FZF
  use { 'junegunn/fzf', run = 'cd $XDG_DATA_HOME/fzf && ./install --xdg --no-update-rc' }
  use 'junegunn/fzf.vim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzy-native.nvim' },
      { "nvim-telescope/telescope-ui-select.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
    }
  }

  -- Motion
  use 'wellle/targets.vim'
  use {
    "ggandor/leap.nvim",
    config = function() require('leap').set_default_keymaps() end
  }
  use { "folke/which-key.nvim" }
  use { 'pechorin/any-jump.vim' }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",

      -- Useful status updates for LSP
      "j-hui/fidget.nvim",
      "folke/lsp-colors.nvim",
    },
  }

  -- Linters
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "jayp0521/mason-null-ls.nvim",
    }
  })

  -- Comp
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lua'
  use 'onsails/lspkind.nvim'

  -- Snippets
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
  use 'mfussenegger/nvim-lint'
  use 'editorconfig/editorconfig-vim'
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup { ignore = '^$' }
    end
  }

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        disable_filetype = { "TelescopePrompt", "vim" },
      })
    end,
  })

  -- Highlighting
  use 'pangloss/vim-javascript'
  use 'othree/javascript-libraries-syntax.vim'
  -- use 'vim-ruby/vim-ruby'
  use 'slim-template/vim-slim'
  use 'mxw/vim-jsx'
  use 'martinda/Jenkinsfile-vim-syntax'

  -- Color
  use 'ellisonleao/gruvbox.nvim'
  use {
    'navarasu/onedark.nvim',
    config = function()
      local onedark = require('onedark')
      onedark.setup {
        style = 'darker',
        code_style = {
          comments = 'italic',
          keywords = 'none',
          functions = 'none',
          strings = 'none',
          variables = 'none'
        },
      }
      onedark.load()
    end
  }

  -- Git
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'tommcdo/vim-fubitive'
  use 'sodapopcan/vim-twiggy'
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      })
    end
  }
  use {
    "TimUntersberger/neogit",
    requires = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
    config = function()
      require('neogit').setup {
        integrations = {
          diffview = true,
        }
      }
      require("diffview").setup {
        hooks = {
          diff_buf_read = function()
            -- Change local options in diff buffers
            vim.opt_local.wrap = false
            vim.opt_local.list = false
            vim.opt_local.colorcolumn = { 80 }
          end,
        }
      }
    end
  }

  -- Html
  use 'mattn/emmet-vim'
  use 'tmhedberg/matchit'

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
