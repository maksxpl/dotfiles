-- https://github.com/nvim-lualine/lualine.nvim
-- statusline
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup({
      options = {
        theme = 'dracula'
      }
    })
  end
}

