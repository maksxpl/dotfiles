-- https://github.com/shellRaining/hlchunk.nvim
-- indents highlight
local linenum_config = {
  enable = true,
  style = "#00f0f0",
  priority = 10,
  use_treesitter = true,
}

local chunk_config = {
  enable = true,
  priority = 15,
  style = {
    { fg = "#806d9c" },
    { fg = "#c21f30" },
  },
  use_treesitter = true,
  chars = {
    horizontal_line = "─",
    vertical_line = "│",
    left_top = "╭",
    left_bottom = "╰",
    right_arrow = ">",
  },
  textobject = "",
  max_file_size = 1024 * 1024,
  error_sign = true,
  -- animation related
  duration = 20,
  delay = 30,
}

return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      line_num = linenum_config,
      chunk = chunk_config,
    })
  end,
}
