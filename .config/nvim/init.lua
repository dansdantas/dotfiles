P = function(v)
  print(vim.inspect(v))
  return v
end

TableMerge = function(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        TableMerge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

require("settings")
require("commands")
require("plugins")

require("plugins.settings")
require("plugins.statusline")
require("plugins.bufferline")
require("plugins.lsp")
require("plugins.telescope")
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.which_key")
