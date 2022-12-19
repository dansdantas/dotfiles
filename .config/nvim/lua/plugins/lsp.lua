local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("mason").setup({
  ui = {
    check_outdated_packages_on_open = false,
  }
})
require("fidget").setup{}

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
  -- Mappings.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap(',rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap(',ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gi', vim.lsp.buf.implementation, '[G]oto [I]mplementation')

  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap(',ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap(',ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- Diagnostics
  nmap(",e", vim.diagnostic.open_float, "Open diagnostic float")
  nmap("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
  nmap("]d", vim.diagnostic.goto_next, "Next diagnostic")
  nmap(",q", vim.diagnostic.setqflist, "Move diagnostics to qlist")

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap(',k', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  -- nmap('<leader>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format({ async = true })
  end, { desc = 'Format current buffer with LSP' })

  nmap(',f', ':Format<cr>', 'Format current buffer with LSP')
end

-- Setup lspconfig.
local lsp = require("lspconfig")

local servers = {
  clangd = {},
  gopls = {
    settings = {
      cmd = { "gopls" },
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
    init_options = {
      usePlaceholders = true,
    },
  },
  pyright = {},
  rust_analyzer = {},
  tsserver = {},
  vimls = {},
  solargraph = {
    autostart = false,
    settings = {
      init_options = {
        formatting = true
      },
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

local server_names = {}
for server, _ in pairs(servers) do
  table.insert(server_names, server)
end

require("mason-lspconfig").setup({
  ensure_installed = server_names,
})

for server, conf in pairs(servers) do
  local full_conf = TableMerge(default_conf, conf)
  lsp[server].setup(full_conf)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  underline = true,
  signs = true,
  update_in_insert = false,
  show_diagnostic_autocmds = { 'InsertLeave' },
})
