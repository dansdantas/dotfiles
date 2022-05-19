P = function(v)
  print(vim.inspect(v))
  return v
end

AddToDo = function ()
  local branch_name = vim.fn.system([[printf $(git rev-parse --abbrev-ref HEAD)]])
  vim.fn.execute('normal! i @todo ' ..branch_name .. ' -')
end

local folding_toggle = function()
  if vim.fn.foldlevel('.') == 0 then
    -- No fold exists at the current line,
    -- so create a fold based on indentation

    local l_min = vim.fn.line('.')   -- current line number
    local l_max = vim.fn.line('$')   --  last line number
    local i_min = vim.fn.indent('.') -- indentation of the current line
    local l = l_min + 1

    local isBlank = function (x)
      return not not tostring(x):find("^%s*$")
    end
    -- Search downward for the last line whose indentation > i_min
    while l <= l_max do
      -- if this line is not blank ...
      local line = vim.fn.getline(l)
      local line_length = vim.fn.strlen(line)

      if line_length > 0 and not isBlank(line) then
        if vim.fn.indent(l) <= i_min then
          -- we've gone too far
          l = l - 1  -- backtrack one line
          break
        end
      end

      l = l + 1
    end

    -- Clamp l to the last line
    if l > l_max then
       l = l_max
    end

    -- " Backtrack to the last non-blank line
    while l > l_min do
      local line = vim.fn.getline(l)
      local line_length = vim.fn.strlen(line)

      if line_length > 0 and not isBlank(l) then
        break
      end

      l = l - 1
    end

    -- "execute "normal i" . l_min . "," . l . " fold"   print debug info

    if l > l_min then
       -- Create the fold from l_min to l
      vim.fn.execute(l_min .. "," .. l .. " fold")
    end
  else
    -- Delete the fold on the current line
    vim.cmd [[normal zd]]
  end
end

vim.api.nvim_create_user_command('Fold', folding_toggle, {})
