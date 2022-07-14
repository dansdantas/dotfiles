local autocommand = vim.api.nvim_create_autocmd

autocommand("FileType", {
  pattern = "vue",
  command = 'syntax sync fromstart'
})

autocommand({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.arb' },
  command = 'setfiletype ruby'
})

local packer_user_config = vim.api.nvim_create_augroup('PackerUserConfig', {})
autocommand({ 'BufWritePost' }, {
  pattern = { 'plugins.lua' },
  command = 'source <afile> | PackerCompile',
  group = packer_user_config
})

autocommand("FileType", {
  pattern = "qf",
  callback = function ()
    vim.opt_local.buflisted = false
  end
})
