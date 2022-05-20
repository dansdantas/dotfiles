local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  local map = vim.keymap

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { silent = true, buffer = bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map.set('n', 'gD', vim.lsp.buf.declaration, opts)
  map.set('n', 'gd', vim.lsp.buf.definition, opts)
  map.set('n', 'K', vim.lsp.buf.hover, opts)
  map.set('n', 'gi', vim.lsp.buf.implementation, opts)
  map.set('n', ',k', vim.lsp.buf.signature_help, opts)
  map.set('n', ',wa', vim.lsp.buf.add_workspace_folder, opts)
  map.set('n', ',wr', vim.lsp.buf.remove_workspace_folder, opts)
  map.set('n', ',wl', function() return P(vim.lsp.buf.list_workspace_folders()) end, opts)
  map.set('n', 'gy', vim.lsp.buf.type_definition, opts)
  map.set('n', ',rn', vim.lsp.buf.rename, opts)
  map.set('n', ',ca', vim.lsp.buf.code_action, opts)
  map.set('n', 'gr', vim.lsp.buf.references, opts)
  map.set('n', ',e', vim.lsp.diagnostic.show_line_diagnostics, opts)
  map.set('n', ',d', vim.diagnostic.setqflist, opts)
  map.set('n', '[d', vim.diagnostic.goto_prev, opts)
  map.set('n', ']d', vim.diagnostic.goto_next, opts)
  map.set('n', ',q', vim.diagnostic.setqflist, opts)
  map.set({ 'n', 'v' }, ',f', vim.lsp.buf.formatting, opts)
  map.set('n', ',so', require('telescope.builtin').lsp_document_symbols, opts)

  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
end

-- Setup lspconfig.
local lsp = require('lspconfig')
lsp.sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local servers = { 'solargraph', 'sorbet', 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'vimls'}
for _, server in ipairs(servers) do
  lsp[server].setup {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }
end
