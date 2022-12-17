local status, null = pcall(require, "null-ls")
if not status then return end

local formatting = null.builtins.formatting
local diagnostics = null.builtins.diagnostics

null.setup({
  sources = {
    formatting.stylua,
    formatting.eslint,

    null.builtins.completion.luasnip,
    null.builtins.code_actions.eslint,

    diagnostics.selene,
    diagnostics.eslint.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
    }),
  },
})
