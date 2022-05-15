vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = {'*.arb'},
  command = 'setfiletype ruby'
})
