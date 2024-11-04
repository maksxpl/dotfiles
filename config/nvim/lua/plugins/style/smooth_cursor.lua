-- https://github.com/gen740/SmoothCursor.nvim
-- cursor effects
return {
  "gen740/SmoothCursor.nvim",
  config = function()
    require("smoothcursor").setup({ fancy = { enable = true }, threshold = 0 })
  end,
}
