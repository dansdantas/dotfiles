return {
	init_options = {
		diagnostics = { enable = true },
		codeAction = { nameExtractVariable = "extracted_var", nameExtractFunction = "extracted_def" },
	},
	-- HACK since init_options cannot be changed during runtime, we need to use
	-- `on_new_config` to set it. Since at `vim.env.VIRTUAL_ENV` is
	-- not set in time, we need to hardcode the identification of the
	-- venv-dir here
	on_new_config = function(config, root_dir)
		local venv_python = root_dir .. "/.venv/bin/python"
		if vim.fn.executable(venv_python) ~= 1 then
			return
		end
		config.init_options.workspace = {
			environmentPath = venv_python,
		}
	end,
}
