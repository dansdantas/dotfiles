local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      'ag',
      '--vimgrep',
      '--hiden',
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
      },
    },

    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
})
require('telescope').load_extension('fzy_native')

local M = {}

M.search_dotfiles = function()
  require('telescope.builtin').find_files {
    prompt_title = 'Dotfiles',
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

return M
