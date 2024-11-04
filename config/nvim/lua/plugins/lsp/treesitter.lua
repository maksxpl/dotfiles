-- https://github.com/nvim-treesitter/nvim-treesitter
-- parser generator for highlights and formatting(?)
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "python", "vim" },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
