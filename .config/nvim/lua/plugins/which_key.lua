local tbuiltin = require("telescope.builtin")
local wk = require("which-key")
local gitsigns = require("gitsigns")

local workspace = require("workspace")
local functions = require('functions')

wk.setup {}
wk.register({
  ["<leader>"] = {
    t = {
      name = "Telescope",
      o = { tbuiltin.find_files, "files" },
      b = { tbuiltin.buffers, "buffers" },
      d = { functions.search_dotfiles, "dotfiles" },
      g = { tbuiltin.grep_string, "grep" },
      ['?'] = { tbuiltin.oldfiles, "recent files" },
      e = { tbuiltin.current_buffer_fuzzy_find, "fuzzy find on buffer" },

      s = {
        f = { function() return tbuiltin.find_files { previewer = false } end, "files without preview" },
        g = { tbuiltin.live_grep, "live grep" }
      },
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
      s = { ":Git status<cr>", "status" },
      a = { gitsigns.stage_hunk, "stage hunk" },
      u = { gitsigns.undo_stage_hunk, "unstage hunk" },
      A = { gitsigns.stage_buffer, "stage buffer" },
      U = { gitsigns.reset_buffer_index, "unstage buffer" },
      p = { gitsigns.prev_hunk, "previous hunk" },
      n = { gitsigns.next_hunk, "next hunk" },
      d = { gitsigns.preview_hunk, "preview hunk" },
      h = { function ()
        gitsigns.blame_line{full=true}
      end, "blame line" }
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

    Q = { ":qa<cr>", "Quit" },

    o = { ":FZF<cr>", "FZF" },

    a = {
      a = { ':Ag<Space>', "search with ag", },
      k = { ':ALEPrevious<cr>', "previous error" },
      K = { ':ALEPreviousWrap<cr>', "previous wrap" },
      j = { ':ALENext<cr>', "next error" },
      J = { ':ALENextWrap<cr>', "next wrap" },
      l = { ':ALELint<cr>', "lint current buffer" },
      t = { ':ALEToggle<cr>', "toggle ale" },
    },

    s = {
      name = 'session',
      s = { ':SSave<cr>', 'save session' },
      l = { ':SLoad ', 'load session' }
    },

    F = { ':NERDTreeToggle<cr>', "toggle nerdtree" },
    f = { ':NERDTreeFind<cr>', "find current file on nerdtree" },

    mt = { ':MaximizerToggle<cr>', "toggle maximize current buffer" },

    z = { functions.folding_toggle, "toggle folding" }
  },

  [","] = {
    a = {
      name = 'AnyJump',
      j = { ':AnyJump<cr>', "jump to definition under cursore" },
      b = { ':AnyJumpBack<cr>', "open previous opened file (after jump)" },
      l = { ':AnyJumpLastResults<cr>', "open last closed search window again" },
    },

    t = {
      n = { ':TestNearest<cr>', "test nearest" },
      f = { ':TestFile<cr>' , "test current file" },
      s = { ':TestSuite<cr>', "test suite" },
      l = { ':TestLast<cr>', "run last test" },
      v = { ':TestVisit<cr>' , "run last visited test" },
      w = { ':TestLastOnlyFail<cr>', "test only failed" },
    },

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

wk.register({
  [",aj"] = { ":AnyJumpVisual", "jump to definition under visual cursor", mode = "v" },
})
