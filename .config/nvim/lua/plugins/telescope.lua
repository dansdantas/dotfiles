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
        ["<Esc>"] = actions.close,
        ["<C-r>"] = actions.select_all,
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
