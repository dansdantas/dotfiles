---@diagnostic disable: assign-type-mismatch
require('bufferline').setup {
  options = {
    indicator = {
      icon = "",
    },
    diagnostics = 'nvim_lsp',
    show_buffer_close_icons = false,
    show_buffer_icons = false,
    separator_style = { "", "" },
  }
}
