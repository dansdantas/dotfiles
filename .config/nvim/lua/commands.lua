local api = vim.api

api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
  pattern = {'*.arb'},
  command = 'setfiletype ruby'
})

local packer_user_config = api.nvim_create_augroup('PackerUserConfig', {})
api.nvim_create_autocmd({'BufWritePost'}, {
  pattern = {'plugins.lua'},
  command = 'source <afile> | PackerCompile',
  group = packer_user_config
})
