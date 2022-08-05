local autocommand = vim.api.nvim_create_autocmd

autocommand("FileType", {
  pattern = "vue",
  command = 'syntax sync fromstart'
})

autocommand({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*.arb' },
  command = 'setfiletype ruby'
})

local packer_user_config = vim.api.nvim_create_augroup('PackerUserConfig', { clear = true })
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

autocommand("BufWritePre", {
  pattern = "NeogitCommitMessage",
  callback = function ()
    print('called')
    vim.fn.system({"touch", "~/.dotfiles.git/NEOGIT_COMMIT_EDITMSG"})
  end
})
