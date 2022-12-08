---@diagnostic disable: undefined-doc-name
local vfn = vim.fn

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local M = {}

M.search_dirs = {}

-- Helpers

---@private
--- Returns nil if {status} is false or nil, otherwise returns the rest of the
--- arguments.
local function ok_or_nil(status, ...)
  if not status then
    return
  end
  return ...
end

---@private
--- Swallows errors.
---
---@param fn Function to run
---@param ... Function arguments
---@returns Result of `fn(...)` if there are no errors, otherwise nil.
--- Returns nil if errors occur during {fn}, otherwise returns
local function npcall(fn, ...)
  return ok_or_nil(pcall(fn, ...))
end

-- Internal functions

local get_workspace_from_user = function(workspace_folder)
  -- Start from current dir and not file name
  workspace_folder = workspace_folder or npcall(vfn.input, 'Folder: ', vfn.expand('%:p:h'), 'dir')
  if not (workspace_folder and #workspace_folder > 0) then
    return
  end

  if vfn.isdirectory(workspace_folder) == 0 then
    print(workspace_folder, ' is not a valid directory')
    return
  end

  return workspace_folder
end

local remove_dir_from_list = function(dir)
  if not dir then
    return
  end

  local uri = vim.uri_from_fname(dir)
  M.search_dirs[uri] = nil
end

local list_dirs = function()
  local dirs = {}

  for _, folder in pairs(M.search_dirs) do
    table.insert(dirs, folder.name)
  end

  return dirs
end

local list_dirs_on_telescope_picker = function(opts)
  local dirs = list_dirs()
  if next(dirs) == nil then
    print("No directories on workspace")
    return
  end

  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "workspaces",
    finder = finders.new_table {
      results = list_dirs(),
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        remove_dir_from_list(selection[1])
      end)
      return true
    end,
  }):find()
end

-- Exposed actions

M.add_dir = function(workspace_folder)
  workspace_folder = get_workspace_from_user(workspace_folder)

  if not workspace_folder then
    return
  end

  local uri = vim.uri_from_fname(workspace_folder)
  M.search_dirs[uri] = { name = workspace_folder }
end

M.remove_dir = function()
  list_dirs_on_telescope_picker(require("telescope.themes").get_dropdown {})
end

M.list_dirs = function()
  return list_dirs()
end

M.clean_dirs = function()
  M.search_dirs = {}
end

M.find_files = function()
  return require("telescope.builtin").find_files {
    hidden = true,
    shorten_path = true,
    search_dirs = list_dirs(),
    width = .25
  }
end

M.grep_files = function()
  return require('telescope.builtin').grep_string {
    search_dirs = list_dirs(),
  }
end

return M
