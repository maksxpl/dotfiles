-- https://github.com/nvimtools/none-ls.nvim
-- lsp injection (not exactly getting what it does yet)
return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
        -- linters
				-- null_ls.builtins.diagnostics.pylint,
				null_ls.builtins.diagnostics.mypy,
        -- formatters
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
			},
		})
	end,
}
