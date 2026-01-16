# AGENTS Notes for dotfiles

## Scope
- This repository is a personal dotfiles collection.
- Most changes live under `.config/` and are configuration scripts, not buildable apps.
- There is no monorepo-style build pipeline.
- The most code-heavy area is the Neovim config in `.config/nvim`.
- Lua tooling is configured via `stylua.toml` and `.config/selene/`.

## Repo Layout Quick Map
- `.config/nvim/` holds Neovim config, plugins, and Lua modules.
- `.config/nvim/lua/` contains Lua modules (`config`, `custom`, `plugins`).
- `.config/nvim/plugin/` contains runtime Lua files (options, keymaps, autocmds).
- `.config/zsh/` stores zsh config split by concern.
- `.config/scripts/` contains small helper scripts (bash).
- `.local/` is reserved for local bin/scripts and machine-specific files.
- Keep new files in the directory matching their tool or concern.

## Build / Lint / Test Commands
- There is no formal build step or global test runner.
- Neovim config uses Lua linting/formatting tools when installed locally.

### Lua formatting (Stylua)
- Format all Neovim Lua:
  - `stylua .config/nvim`
- Check formatting without writing:
  - `stylua --check .config/nvim`
- Format a single file:
  - `stylua .config/nvim/init.lua`
- Check a single file:
  - `stylua --check .config/nvim/plugin/options.lua`

### Lua linting (Selene)
- Lint all Neovim Lua with the repo config:
  - `selene --config .config/selene/selene.toml .config/nvim`
- Lint a single file:
  - `selene --config .config/selene/selene.toml .config/nvim/init.lua`

### Shell scripts (optional)
- There is no repo-level shell lint setup.
- If `shellcheck` is installed, you can lint scripts manually:
  - `shellcheck .config/scripts/launcher`
  - `shellcheck .config/polybar/scripts/updates.sh`

### Neovim test helpers (interactive)
- Keymaps in `.config/nvim/plugin/keymaps.lua` map to vim-test commands.
- These run inside Neovim (not in the shell):
  - `:TestNearest` runs the closest test.
  - `:TestFile` runs the current file.
  - `:TestSuite` runs all tests.
- There are no repo-owned tests; these commands target external projects.

## Code Style Guidelines

### General
- Keep changes minimal and consistent with the existing config style.
- Prefer editing existing files instead of creating new ones.
- Preserve ordering of settings and keymaps unless a change requires reordering.
- Keep comments that document intent or source links.
- Short locals like `opt` and `map` are common and acceptable.

### Lua (Neovim config)
- Indentation follows the existing files (tabs are common).
- Use double quotes for strings in Lua (`"..."`).
- Group `require(...)` calls at the top of the file.
- Prefer `local` for variables and functions.
- Use `vim.opt`, `vim.g`, and `vim.api` for settings and API calls.
- Use `vim.keymap.set` (or local aliases like `map.set`) for mappings.
- Provide a `desc` field for keymaps whenever possible.
- Use `pcall(require, ...)` when a plugin may be optional.
- Use `vim.notify` or `vim.api.nvim_echo` for user-visible errors.
- Keep module files small and purpose-driven (options, keymaps, autocmds).

### Lua formatting and layout
- Keep tables compact and aligned as in neighboring code.
- Keep trailing commas when the surrounding style uses them.
- Prefer multi-line tables for readability when entries exceed 120 chars.

### Lua typing
- Prefer `---@` annotations only when they add clarity for LSP.
- Use `---@type` for module tables or complex configs.
- Avoid adding type stubs for globals unless already present.

### Neovim plugin structure
- Plugin specs live in `.config/nvim/lua/plugins/*.lua` and `return` a table.
- Keep one topic per plugin file; use descriptive or numeric prefixes as seen.
- Use `opts` for simple configuration tables; use `config` for logic.
- Prefer lazy loading via `event`, `ft`, `cmd`, or `keys` when sensible.
- Avoid hand-editing `.config/nvim/lazy-lock.json` unless necessary.

### Shell scripts (bash)
- Use a bash shebang (`#!/bin/bash`) to match existing scripts.
- Use lowercase variable names (e.g., `dir`, `theme`).
- Quote variable expansions unless a glob is intended.
- Keep scripts short and focused, similar to existing examples.
- Avoid adding strict mode unless the script already uses it.

### Shell safety conventions
- Prefer `set -e` or `set -euo pipefail` only when file already uses it.
- Use `command -v tool >/dev/null` for optional dependencies.
- Guard destructive commands (`rm`, `mv`, `kill`) with prompts or checks.

### Zsh configuration
- Zsh config lives under `.config/zsh/`.
- Follow existing file structure (`aliases`, `env`, `options`, `keybinds`).

### Other config formats
- Keep TOML, YAML, INI, and KDL files in their existing formatting.
- Avoid reformatting unless you are changing adjacent lines.
- Use the same quoting and key casing as the current file.

### Config naming and layout
- Use existing directory for each tool or concern.
- Prefer lower-case, hyphenated filenames where already present.
- Keep config splits consistent with the owning tool (`aliases`, `env`, `options`).
- Keep per-machine data in `.local/`.

### Generated or machine-specific files
- `.config/nvim/lazy-lock.json` is generated by lazy.nvim.
- `.config/zsh/.zcompdump` and `.config/zsh/.zcompcache/` are generated caches.
- `.local/` is intended for per-machine binaries or secrets.
- Avoid editing generated files unless the task requires it.

### Error handling patterns
- For Lua, use `pcall` when loading optional plugins or modules.
- Check shell command failures only when they affect downstream steps.
- When exiting in Lua, mirror `init.lua`’s explicit error messages.

### Naming conventions
- Lua modules use `snake_case.lua` or nested folder names.
- Functions use `snake_case` and short verbs (`find_files`, `folding_toggle`).
- Use uppercase globals only when already established (`P`, `R`).

### Git and commit conventions
- Use concise, imperative commit subjects (e.g., "Add", "Fix", "Update").
- Keep subjects under ~72 chars when possible.
- Avoid bundling unrelated config changes into one commit.
- Prefer separate commits for formatting-only changes.

## Lint/format review
- `stylua.toml` only sets `collapse_simple_statement = "FunctionOnly"`; consider adding `indent_type`, `indent_width`, and `column_width` for clearer expectations.
- `selene.toml` allows `multiple_statements` and `mixed_table`; this matches lazy.nvim patterns but reduces strictness—use sparingly for new code.
- `selene` uses a custom std at `.config/selene/std.yml`; update it if new globals are introduced.
- If stricter Lua linting is desired, consider enabling `unused_variable` and `shadowing` checks.

## Notes on repository rules
- No `.cursorrules`, `.cursor/rules/`, or `.github/copilot-instructions.md` found.
- If any of these are added later, include their content verbatim here.
- This file should stay close to existing repo conventions and tooling.
