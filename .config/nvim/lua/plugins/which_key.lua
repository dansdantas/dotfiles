local tbuiltin = require("telescope.builtin")
local wk = require("which-key")
local workspace = require("workspace")

local search_dotfiles = function()
  require('telescope.builtin').find_files {
    prompt_title = 'dotfiles',
    cwd = "$HOME",
    find_command = {
      'dot',
      'ls-tree',
      '--full-tree',
      '-r',
      '--name-only',
      'HEAD'
    }
  }
end

wk.setup {}
wk.register({
  ["<leader>"] = {
    t = {
      name = "Telescope",
      o = { tbuiltin.find_files, "files" },
      b = { tbuiltin.buffers, "buffers" },
      d = { search_dotfiles, "dotfiles" },
      g = { tbuiltin.grep_string, "grep" },
      ['?'] = { tbuiltin.oldfiles, "recent files" },
      e = { tbuiltin.current_buffer_fuzzy_find, "fuzzy find on buffer" },

      s = {
        f = { function() return tbuiltin.find_files { previewer = false } end, "files without preview" },
        g = { tbuiltin.live_grep, "live grep" }
      }
    },

    b = {
      name = "buffer",
      c = { ":bd!<cr>", "close" },
      d = { ":bd|e#<cr>", "close all but current" },
      D = { ":%bd!<cr>", "close all" },
    },

    g = {
      name = "Git",
      t = { require('neogit').open, "neogit" },
      c = { tbuiltin.git_commits, "commits" },
      b = { tbuiltin.git_branches, "branches" },
      s = { ":Git status<cr>", "status" }
    },

    v = {
      name = "Vim",
      c = { tbuiltin.commands, "commands" },
      h = { tbuiltin.help_tags, "help" },
    },

    l = {
      name = "load",
      u = { ":luafile %<cr>", "current file as lua" }
    },

    Q = { ":qa<cr>", "Quit" }
  },

  [","] = {
    w = {
      name = "workspace",
      a = { workspace.add_dir, "add dir" },
      r = { workspace.remove_dir, "remove dir" },
      f = { workspace.find_files, "find files" },
      g = { workspace.grep_files, "grep on files " },
      c = { workspace.clean_dirs, "clean dirs" },
      l = { function() return P(workspace.list_dirs()) end, "list dirs" }
    },
  },
})
