local M = {}

local tokyo_colors = require("tokyonight.colors").setup()
local tokyo_util = require("tokyonight.util")

local function getLen(str, start_pos)
  local byte = string.byte(str, start_pos)
  if not byte then
    return nil
  end
  return (byte < 0x80 and 1) or (byte < 0xE0 and 2) or (byte < 0xF0 and 3) or (byte < 0xF8 and 4) or 1
end

local colors = {
  ["w"] = { fg = tokyo_util.white },
  ["b"] = { fg = tokyo_colors.blue },
  ["o"] = { fg = tokyo_colors.orange },
  ["s"] = { fg = tokyo_util.lighten(tokyo_colors.red, 0.3) },
  ["t"] = { fg = tokyo_colors.red },
}

-- New table to store highlight group names
local highlight_groups = {}

function M.colorize(header, header_color_map)
  -- Create highlight groups without overwriting the original colors
  for letter, color in pairs(colors) do
    local color_name = "CustomColor_" .. letter
    vim.api.nvim_set_hl(0, color_name, color)
    highlight_groups[letter] = color_name -- Store highlight group name separately
  end

  local colorized = {}

  for i, line in ipairs(header_color_map) do
    local colorized_line = {}
    local pos = 0

    for j = 1, #line do
      local start = pos
      pos = pos + getLen(header[i], start + 1)

      -- Use the new highlight_groups table
      local color_name = highlight_groups[line:sub(j, j)]
      if color_name then
        table.insert(colorized_line, { color_name, start, pos })
      end
    end

    table.insert(colorized, colorized_line)
  end

  return colorized
end

return M
