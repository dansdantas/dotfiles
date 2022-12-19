local status, null = pcall(require, "null-ls")
if not status then return end

local formatting = null.builtins.formatting
local diagnostics = null.builtins.diagnostics

require("mason-null-ls").setup({
  ensure_installed = { "stylua", "eslint_d", "rubocop", "prettierd" }
})

null.setup({
  sources = {
    formatting.stylua,
    formatting.eslint,

    null.builtins.completion.luasnip,
    null.builtins.code_actions.eslint,

    diagnostics.selene.with({
      extra_args = { "-c ~/.config/selene/config.toml" },
    }),
    diagnostics.eslint.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})',
    }),
  },
})
