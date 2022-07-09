---@diagnostic disable: undefined-doc-name
local vfn = vim.fn

local M = {}

M.search_dirs = {}

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

M.add_dir = function(workspace_folder)
  workspace_folder = get_workspace_from_user(workspace_folder)

  if not workspace_folder then
    return
  end

  local uri = vim.uri_from_fname(workspace_folder)
  M.search_dirs[uri] = { name = workspace_folder }
end

M.remove_dir = function(workspace_folder)
  -- TODO: list already added workspaces instead of searching
  workspace_folder = get_workspace_from_user(workspace_folder)

  if not workspace_folder then
    return
  end

  local uri = vim.uri_from_fname(workspace_folder)
  M.search_dirs[uri] = nil
end

M.list_dirs = function()
  return M.search_dirs
end

M.clean_dirs = function()
  M.search_dirs = {}
end

M.find_files = function()
  local search_dirs = {}
  for _, folder in pairs(M.search_dirs) do
    table.insert(search_dirs, folder.name)
  end

  return require("telescope.builtin").find_files {
    search_dirs = search_dirs,
    width = .25
  }
end

M.grep_files = function()
  return print('TODO')
end

return M
