local M = {}

local myutils = require("utils.colors")

vim.cmd("hi DateHighlight guifg=#ff5000")

local date = os.date("%A, %B %d, %Y - %H:%M")
local date_total_width = 40

local function center_text(text, width)
  local padding = math.max(0, math.floor((width - #text) / 2))
  return string.rep(" ", padding) .. text .. string.rep(" ", padding)
end

-- Create the lines for the date header
M.header = {
  "┌" .. string.rep(" ", date_total_width - 2) .. "┐",
  center_text(date, date_total_width),
  "└" .. string.rep(" ", date_total_width - 2) .. "┘",
}

local color_map = {
  [[oooooooooooooooooooooooooooooooooooooooo]],
  [[wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww]],
  [[oooooooooooooooooooooooooooooooooooooooo]],
}

-- Get the colorized lines
M.color_map = myutils.colorize(M.header, color_map)

-- Return a flat list of strings
return M
