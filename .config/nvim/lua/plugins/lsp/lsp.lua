-- Language Server Protocol
return {
  -- https://github.com/williamboman/mason.nvim 
  -- lsp package manager
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup({})
		end,
	},
  -- https://github.com/williamboman/mason-lspconfig.nvim
  -- mason-lspconfig bridge
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright" },
			})
		end,
	},
  -- https://github.com/neovim/nvim-lspconfig
  -- lsp config manager
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local on_attach = function(client, bufnr) end
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "javascript" },
			})
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "lua" },
			})
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "python" },
			})
		end,
	},
}
