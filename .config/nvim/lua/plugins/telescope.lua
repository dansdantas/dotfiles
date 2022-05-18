local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      'ag',
      '--vimgrep',
      '--hidden',
      '--ignore .git',
      '-l',
      '--ignore spec/fixtures',
      '-g'
    },

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = {
      i = {
        ["C-x"] = false,
        ["C-q"] = actions.send_to_qflist,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-b>"] = actions.preview_scrolling_down,
        ["<C-f>"] = actions.preview_scrolling_up,
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-b>"] = actions.preview_scrolling_down,
        ["<C-f>"] = actions.preview_scrolling_up,
      },
    },

    file_sorter = require('telescope.sorters').get_fzy_sorter,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})

require('telescope').load_extension('fzy_native')

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

-- Mappings
local map = vim.keymap
map.set('n', '<leader>to', require('telescope.builtin').find_files)
map.set('n', '<leader>tb', require('telescope.builtin').buffers)
map.set('n', '<leader>td', search_dotfiles)
map.set('n', '<leader>tg', require('telescope.builtin').grep_string)

map.set('n', '<leader>?', require('telescope.builtin').oldfiles)
map.set('n', '<leader><space>', require('telescope.builtin').buffers)
map.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files { previewer = false }
end)
map.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
map.set('n', '<leader>sh', require('telescope.builtin').help_tags)
map.set('n', '<leader>sd', require('telescope.builtin').grep_string)
map.set('n', '<leader>sp', require('telescope.builtin').live_grep)

map.set('n', '<leader>st', require('telescope.builtin').tags)
map.set('n', '<leader>so', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
