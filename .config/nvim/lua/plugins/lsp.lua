local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("nvim-lsp-installer").setup({})

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  local map = vim.keymap

  --Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  local opts = { silent = true, buffer = bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  map.set("n", "gD", vim.lsp.buf.declaration, opts)
  map.set("n", "gd", vim.lsp.buf.definition, opts)
  map.set("n", "K", vim.lsp.buf.hover, opts)
  map.set("n", "gi", vim.lsp.buf.implementation, opts)
  map.set("n", ",k", vim.lsp.buf.signature_help, opts)
  map.set("n", "gy", vim.lsp.buf.type_definition, opts)
  map.set("n", ",rn", vim.lsp.buf.rename, opts)
  map.set("n", ",ca", vim.lsp.buf.code_action, opts)
  map.set("n", "gr", vim.lsp.buf.references, opts)
  map.set("n", ",e", vim.diagnostic.open_float, opts)
  map.set("n", ",d", vim.diagnostic.setqflist, opts)
  map.set("n", "[d", vim.diagnostic.goto_prev, opts)
  map.set("n", "]d", vim.diagnostic.goto_next, opts)
  map.set("n", ",q", vim.diagnostic.setqflist, opts)

  map.set({ "n", "v" }, ",f", function()
    return vim.lsp.buf.format({ async = true })
  end, opts)

  map.set("n", ",so", require("telescope.builtin").lsp_document_symbols, opts)
end

-- Setup lspconfig.
local lsp = require("lspconfig")

local servers = {
  clangd = {},
  gopls = {},
  pyright = {},
  rust_analyzer = {},
  tsserver = { settings = { autostart = false } },
  vimls = {},
  solargraph = {
    settings = {
      init_options = {
        formatting = true
      },
      autostart = false,
      solargraph = {
        diagnostics = true,
      }
    }
  },
  sumneko_lua = {
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim", "table", "pairs", "package", "require" },
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
  },
}

local default_conf = {
  flags = { debounce_text_changes = 150 },
  capabilities = capabilities,
  on_attach = on_attach,
}

for server, conf in pairs(servers) do
  local full_conf = TableMerge(default_conf, conf)
  lsp[server].setup(full_conf)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  underline = true,
  signs = true,
  update_in_insert = false,
})
